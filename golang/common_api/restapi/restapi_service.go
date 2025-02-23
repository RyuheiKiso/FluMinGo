package restapi

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
