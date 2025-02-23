package gateway

import (
	"fmt"
	"net/http"
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
