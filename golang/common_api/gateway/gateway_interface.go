// Package gateway defines the contract for the API gateway.
package gateway

import "net/http"

// Gateway is the interface for an API gateway handler.
// It defines a contract for handling HTTP requests.

type Gateway interface {
	// HandleRequest processes an HTTP request and writes a response.
	HandleRequest(w http.ResponseWriter, r *http.Request)
}
