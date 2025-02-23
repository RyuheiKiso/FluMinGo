package websocket

import "log"

// WebSocketService はWebSocketを通じたサービス処理を担当する構造体です。
// 必要に応じてフィールドを追加してください。
type WebSocketService struct {}

// NewWebSocketService は新しいWebSocketServiceのインスタンスを生成します。
func NewWebSocketService() *WebSocketService {
	return &WebSocketService{}
}

// ProcessMessage は受信したメッセージを処理します。
// このサンプルでは単純に受信メッセージをそのまま返すエコー処理を行っています。
func (s *WebSocketService) ProcessMessage(message []byte) ([]byte, error) {
	log.Println("ProcessMessage メソッドが呼び出されました")
	// ビジネスロジックをここに実装
	return message, nil
}
