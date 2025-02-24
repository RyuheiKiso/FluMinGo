package restapi

import "time"

// Service は REST API のビジネスロジックを実装する構造体です。
// 以下はサンプル実装です。

// Service 構造体の定義
type Service struct{}

// NewService は Service の新規インスタンスを生成します
func NewService() *Service {
	return &Service{}
}

// GetMessage はサンプルのメッセージを返します
func (s *Service) GetMessage() (string, error) {
	// サンプルのメッセージを返す
	return "こんにちは、APIからのメッセージです", nil
}

// GetVersion は API のバージョンを返します
func (s *Service) GetVersion() (string, error) {
	return "v1.0.0", nil
}

// GetStatus は API のステータスを返します
func (s *Service) GetStatus() (string, error) {
	return "API is running", nil
}

// 新機能: GetUser はユーザー情報を返すメソッドです
func (s *Service) GetUser() (string, error) {
	return "Dummy User", nil
}

// 新機能: GetServerTime はサーバーの現在時刻を返すメソッドです
func (s *Service) GetServerTime() (string, error) {
	return time.Now().Format(time.RFC3339), nil
}
