package gateway

import (
	"fmt"
	"net/http"
	"time"
)

// APIHandler implements the Gateway interface defined in gateway_interface.go
// It handles incoming HTTP requests.

type APIHandler struct{}

// NewAPIHandler creates a new instance of APIHandler.
func NewAPIHandler() *APIHandler {
	return &APIHandler{}
}

// HandleRequest processes an HTTP request and writes a response.
func (h *APIHandler) HandleRequest(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "API Gateway received the request.")
}

// HandleRequestWithLogging はリクエストを処理し、ログを出力します。
func (h *APIHandler) HandleRequestWithLogging(w http.ResponseWriter, r *http.Request) {
	fmt.Println("Received request:", r.Method, r.URL.Path)
	h.HandleRequest(w, r)
}

// HandleRequestWithMetrics はリクエストを処理し、メトリクスを収集します。
func (h *APIHandler) HandleRequestWithMetrics(w http.ResponseWriter, r *http.Request) {
	start := time.Now()
	h.HandleRequest(w, r)
	duration := time.Since(start)
	fmt.Println("Request processed in", duration)
}

// 新しいメソッドを追加して、APIハンドラーのエラーログを取得します。
func (h *APIHandler) GetErrorLogs() []string {
	return []string{"Error log 1", "Error log 2"}
}

// 新しいメソッドを追加して、APIハンドラーのメトリクスを取得します。
func (h *APIHandler) GetMetrics() map[string]interface{} {
	return map[string]interface{}{"requests": 15000, "errors": 300}
}
