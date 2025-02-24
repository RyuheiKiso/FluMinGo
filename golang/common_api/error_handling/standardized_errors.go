package error_handling

import "fmt"

// StandardError エラー情報を標準化するための構造体
// Code: エラーコード、Message: エラーメッセージ
// 必要に応じて詳細な情報のフィールドを追加可能

type StandardError struct {
	Code    int
	Message string
}

// Error StandardErrorをerrorインターフェースに適合させるためのメソッド
func (e StandardError) Error() string {
	return fmt.Sprintf("Error %d: %s", e.Code, e.Message)
}

// エラーの詳細情報を追加
func (e StandardError) Details() string {
	return fmt.Sprintf("Error details - Code: %d, Message: %s", e.Code, e.Message)
}

// NewStandardError 指定されたコードとメッセージで新しいStandardErrorを生成する
func NewStandardError(code int, message string) error {
	return StandardError{
		Code:    code,
		Message: message,
	}
}

// LogError エラーをログに出力する（実際の運用では、外部ロギングシステムやモニタリング連携が必要）
func LogError(err error) {
	// ここでは標準出力に出力する
	fmt.Println(err.Error())
}

// エラーコードに基づいてエラーメッセージを取得する機能を追加
func GetErrorMessage(code int) string {
	switch code {
	case 404:
		return "Not Found"
	case 500:
		return "Internal Server Error"
	default:
		return "Unknown Error"
	}
}
