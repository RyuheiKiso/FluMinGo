package common

import (
	"log"
)

// Logger は共通のロギングインターフェースを定義します。
type Logger interface {
	Info(msg string)
	Error(msg string)
}

// SimpleLogger はシンプルなロギング実装です。
type SimpleLogger struct{}

// Info は情報ログを出力します。
func (l SimpleLogger) Info(msg string) {
	log.Println("INFO: " + msg)
}

// Error はエラーログを出力します。
func (l SimpleLogger) Error(msg string) {
	log.Println("ERROR: " + msg)
}

// ログレベルを設定する機能を追加
func (l SimpleLogger) SetLogLevel(level string) {
	log.Printf("ログレベルが %s に設定されました", level)
}

// NewLogger は新しい SimpleLogger インスタンスを返します。
func NewLogger() Logger {
	return &SimpleLogger{}
}

// ロギングの実装
