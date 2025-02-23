package websocket

import (
	"log"
	"net/http"

	"github.com/gorilla/websocket"
)

// websocketアップグレーダーの設定
var upgrader = websocket.Upgrader{
	ReadBufferSize:  1024,
	WriteBufferSize: 1024,
	// オリジンチェック。必要に応じて実装を変更してください
	CheckOrigin: func(r *http.Request) bool { return true },
}

// WebSocketHandler はWebSocket接続のハンドリングを行う構造体です
// 必要なフィールドを適宜追加してください
type WebSocketHandler struct {}

// NewWebSocketHandler は新しいWebSocketハンドラーのインスタンスを生成します
func NewWebSocketHandler() *WebSocketHandler {
	return &WebSocketHandler{}
}

// HandleConnection はHTTPリクエストをWebSocket接続にアップグレードし、通信を開始します
func (h *WebSocketHandler) HandleConnection(w http.ResponseWriter, r *http.Request) {
	conn, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Printf("WebSocketアップグレードに失敗しました: %v", err)
		return
	}
	defer conn.Close()
	log.Println("新しいWebSocket接続を確立しました")

	// エコー処理の例
	for {
		messageType, message, err := conn.ReadMessage()
		if err != nil {
			log.Printf("メッセージ読み取りエラー: %v", err)
			break
		}
		log.Printf("受信メッセージ: %s", message)
		if err := conn.WriteMessage(messageType, message); err != nil {
			log.Printf("メッセージ送信エラー: %v", err)
			break
		}
	}
}
