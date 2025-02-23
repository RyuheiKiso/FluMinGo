package gateway

import (
	"encoding/json"
	"errors"
	"io/ioutil"
	"net/http"
)

// GRPCRequest is a simplified representation of a gRPC request.
// In a real-world scenario, this would be replaced with an actual gRPC message type.
type GRPCRequest struct {
	Method string                 `json:"method"`
	Path   string                 `json:"path"`
	Body   map[string]interface{} `json:"body"`
}

// GRPCResponse is a simplified representation of a gRPC response.
// In a real-world scenario, this would be replaced with an actual gRPC response type.
type GRPCResponse struct {
	StatusCode int                    `json:"statusCode"`
	Body       map[string]interface{} `json:"body"`
}

// ConvertRESTToGRPC converts an HTTP request into a GRPCRequest.
func ConvertRESTToGRPC(r *http.Request) (*GRPCRequest, error) {
	if r == nil {
		return nil, errors.New("nil http request")
	}

	// Read the request body
	bodyBytes, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return nil, err
	}
	defer r.Body.Close()

	var bodyMap map[string]interface{}
	if len(bodyBytes) > 0 {
		if err := json.Unmarshal(bodyBytes, &bodyMap); err != nil {
			return nil, err
		}
	} else {
		bodyMap = make(map[string]interface{})
	}

	grpcReq := &GRPCRequest{
		Method: r.Method,
		Path:   r.URL.Path,
		Body:   bodyMap,
	}

	return grpcReq, nil
}

// ConvertGRPCToREST converts a GRPCResponse into HTTP response components.
func ConvertGRPCToREST(grpcResp *GRPCResponse) (int, []byte, error) {
	if grpcResp == nil {
		return 0, nil, errors.New("nil grpc response")
	}

	respBytes, err := json.Marshal(grpcResp.Body)
	if err != nil {
		return 0, nil, err
	}

	return grpcResp.StatusCode, respBytes, nil
}
