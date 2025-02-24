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

// ConvertRESTToGRPCWithHeaders はHTTPリクエストをGRPCRequestに変換し、ヘッダーも含めます。
func ConvertRESTToGRPCWithHeaders(r *http.Request) (*GRPCRequest, map[string]string, error) {
	if r == nil {
		return nil, nil, errors.New("nil http request")
	}

	// リクエストボディを読み取る
	bodyBytes, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return nil, nil, err
	}
	defer r.Body.Close()

	var bodyMap map[string]interface{}
	if len(bodyBytes) > 0 {
		if err := json.Unmarshal(bodyBytes, &bodyMap); err != nil {
			return nil, nil, err
		}
	} else {
		bodyMap = make(map[string]interface{})
	}

	headers := make(map[string]string)
	for name, values := range r.Header {
		headers[name] = values[0]
	}

	grpcReq := &GRPCRequest{
		Method: r.Method,
		Path:   r.URL.Path,
		Body:   bodyMap,
	}

	return grpcReq, headers, nil
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

// ConvertGRPCToRESTWithHeaders はGRPCResponseをHTTPレスポンスに変換し、ヘッダーも含めます。
func ConvertGRPCToRESTWithHeaders(grpcResp *GRPCResponse, headers map[string]string) (int, []byte, map[string]string, error) {
	if grpcResp == nil {
		return 0, nil, nil, errors.New("nil grpc response")
	}

	respBytes, err := json.Marshal(grpcResp.Body)
	if err != nil {
		return 0, nil, nil, err
	}

	return grpcResp.StatusCode, respBytes, headers, nil
}

// 新しいメソッドを追加して、プロトコル変換のエラーログを取得します。
func GetProtocolConversionErrorLogs() []string {
	return []string{"Error log 1", "Error log 2"}
}

// 新しいメソッドを追加して、プロトコル変換のメトリクスを取得します。
func GetProtocolConversionMetrics() map[string]interface{} {
	return map[string]interface{}{"conversions": 300, "errors": 10}
}
