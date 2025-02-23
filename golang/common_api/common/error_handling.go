package common

import "fmt"

// ErrorHandler は共通のエラーハンドリングインターフェースを定義します。
type ErrorHandler interface {
	HandleError(err error) string
}

// SimpleErrorHandler はシンプルなエラーハンドリング実装です。
type SimpleErrorHandler struct{}

// HandleError はエラーを処理し、エラーメッセージを返します。
func (e SimpleErrorHandler) HandleError(err error) string {
	return fmt.Sprintf("エラーが発生しました: %v", err)
}

// NewErrorHandler は新しい SimpleErrorHandler インスタンスを返します。
func NewErrorHandler() ErrorHandler {
	return &SimpleErrorHandler{}
}
