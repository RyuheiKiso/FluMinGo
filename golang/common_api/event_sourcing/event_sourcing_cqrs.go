package event_sourcing

// イベントソーシングとCQRSの実装

// Event はイベントのインターフェースを定義します。
type Event interface {
	EventType() string
	EventData() interface{}
}

// EventStore はイベントストアのインターフェースを定義します。
type EventStore interface {
	Save(event Event) error
	Load(aggregateID string) ([]Event, error)
}

// Command はコマンドのインターフェースを定義します。
type Command interface {
	CommandType() string
	CommandData() interface{}
}

// CommandHandler はコマンドハンドラーのインターフェースを定義します。
type CommandHandler interface {
	Handle(command Command) error
}

// Aggregate は集約のインターフェースを定義します。
type Aggregate interface {
	AggregateID() string
	Apply(event Event) error
}

// AggregateRoot は集約の基本構造体です。
type AggregateRoot struct {
	ID string
}

// AggregateID は集約のIDを返します。
func (ar *AggregateRoot) AggregateID() string {
	return ar.ID
}

// Apply はイベントを適用します。
func (ar *AggregateRoot) Apply(event Event) error {
	// イベント適用ロジックをここに追加します。
	return nil
}

// EventSourcingCQRS はイベントソーシングとCQRSのメイン構造体です。
type EventSourcingCQRS struct {
	eventStore     EventStore
	commandHandler CommandHandler
}

// NewEventSourcingCQRS は新しいEventSourcingCQRSを作成します。
func NewEventSourcingCQRS(eventStore EventStore, commandHandler CommandHandler) *EventSourcingCQRS {
	return &EventSourcingCQRS{
		eventStore:     eventStore,
		commandHandler: commandHandler,
	}
}

// HandleCommand はコマンドを処理します。
func (escqrs *EventSourcingCQRS) HandleCommand(command Command) error {
	return escqrs.commandHandler.Handle(command)
}

// SaveEvent はイベントを保存します。
func (escqrs *EventSourcingCQRS) SaveEvent(event Event) error {
	return escqrs.eventStore.Save(event)
}

// LoadEvents はイベントをロードします。
func (escqrs *EventSourcingCQRS) LoadEvents(aggregateID string) ([]Event, error) {
	return escqrs.eventStore.Load(aggregateID)
}
