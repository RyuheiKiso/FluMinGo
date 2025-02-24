package common

import (
	"fmt"
	"os"
)

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

// エラーログをファイルに保存する機能を追加
func (e SimpleErrorHandler) LogErrorToFile(err error, filePath string) error {
	file, fileErr := os.OpenFile(filePath, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)
	if fileErr != nil {
		return fileErr
	}
	defer file.Close()
	_, writeErr := file.WriteString(fmt.Sprintf("エラーが発生しました: %v\n", err))
	return writeErr
}

// NewErrorHandler は新しい SimpleErrorHandler インスタンスを返します。
func NewErrorHandler() ErrorHandler {
	return &SimpleErrorHandler{}
}
