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
