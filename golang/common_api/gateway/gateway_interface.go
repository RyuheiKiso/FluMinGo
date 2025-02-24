// Package gateway defines the contract for the API gateway.
package gateway

import "net/http"

// Gateway is the interface for an API gateway handler.
// It defines a contract for handling HTTP requests.

type Gateway interface {
	// HandleRequest processes an HTTP request and writes a response.
	HandleRequest(w http.ResponseWriter, r *http.Request)
}

// GatewayImpl は Gateway インターフェースを実装する構造体です。
type GatewayImpl struct{}

// RegisterRoute は新しいルートを登録します。
func (g *GatewayImpl) RegisterRoute(path string, handler http.Handler) {
	// ルート登録ロジックをここに追加します。
}

// UnregisterRoute は既存のルートを解除します。
func (g *GatewayImpl) UnregisterRoute(path string) {
	// ルート解除ロジックをここに追加します。
}

// 新しいメソッドを追加して、ゲートウェイのエラーログを取得します。
func (g *GatewayImpl) GetErrorLogs() []string {
	return []string{"Error log 1", "Error log 2"}
}
