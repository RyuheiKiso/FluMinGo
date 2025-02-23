package async

import (
	"context"
	"fmt"

	"github.com/segmentio/kafka-go"
	"github.com/streadway/amqp"
)

// MessageQueue は Kafka/RabbitMQ を利用した非同期・イベント駆動処理のための機能を提供する
// キューへのメッセージ発行と購読処理を実装

type MessageQueue struct {
	brokerType    string
	kafkaWriter   *kafka.Writer
	rabbitConn    *amqp.Connection
	rabbitChannel *amqp.Channel
}

// NewMessageQueue は MessageQueue の新しいインスタンスを生成する
func NewMessageQueue(brokerType, brokerURL string) (*MessageQueue, error) {
	mq := &MessageQueue{brokerType: brokerType}
	var err error

	switch brokerType {
	case "kafka":
		mq.kafkaWriter = &kafka.Writer{
			Addr: kafka.TCP(brokerURL),
		}
	case "rabbitmq":
		mq.rabbitConn, err = amqp.Dial(brokerURL)
		if err != nil {
			return nil, fmt.Errorf("failed to connect to RabbitMQ: %w", err)
		}
		mq.rabbitChannel, err = mq.rabbitConn.Channel()
		if err != nil {
			return nil, fmt.Errorf("failed to open a channel: %w", err)
		}
	default:
		return nil, fmt.Errorf("unsupported broker type: %s", brokerType)
	}

	return mq, nil
}

// PublishMessage は指定されたキューにメッセージを発行する
func (mq *MessageQueue) PublishMessage(queueName, message string) error {
	switch mq.brokerType {
	case "kafka":
		return mq.kafkaWriter.WriteMessages(context.Background(), kafka.Message{
			Topic: queueName,
			Value: []byte(message),
		})
	case "rabbitmq":
		return mq.rabbitChannel.Publish(
			"",
			queueName,
			false,
			false,
			amqp.Publishing{
				ContentType: "text/plain",
				Body:        []byte(message),
			},
		)
	default:
		return fmt.Errorf("unsupported broker type: %s", mq.brokerType)
	}
}

// Subscribe は指定されたキューからメッセージを購読し、ハンドラで処理する
func (mq *MessageQueue) Subscribe(queueName string, handler func(string)) error {
	switch mq.brokerType {
	case "kafka":
		reader := kafka.NewReader(kafka.ReaderConfig{
			Brokers: []string{mq.kafkaWriter.Addr.String()},
			Topic:   queueName,
		})
		for {
			msg, err := reader.ReadMessage(context.Background())
			if err != nil {
				return fmt.Errorf("failed to read message: %w", err)
			}
			handler(string(msg.Value))
		}
	case "rabbitmq":
		deliveries, err := mq.rabbitChannel.Consume(
			queueName,
			"",
			true,
			false,
			false,
			false,
			nil,
		)
		if err != nil {
			return fmt.Errorf("failed to register a consumer: %w", err)
		}
		for d := range deliveries {
			handler(string(d.Body))
		}
	default:
		return fmt.Errorf("unsupported broker type: %s", mq.brokerType)
	}
	return nil
}

// Close は接続を閉じる
func (mq *MessageQueue) Close() error {
	switch mq.brokerType {
	case "kafka":
		return mq.kafkaWriter.Close()
	case "rabbitmq":
		if err := mq.rabbitChannel.Close(); err != nil {
			return err
		}
		return mq.rabbitConn.Close()
	default:
		return fmt.Errorf("unsupported broker type: %s", mq.brokerType)
	}
}
