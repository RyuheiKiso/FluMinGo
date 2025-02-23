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

// NewLogger は新しい SimpleLogger インスタンスを返します。
func NewLogger() Logger {
	return &SimpleLogger{}
}
