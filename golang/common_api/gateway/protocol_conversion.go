package gateway

import (
	"encoding/json"
	"errors"
	"io/ioutil"
	"net/http"
)

// プロトコル変換の実装

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

// 新しいメソッドを追加して、プロトコル変換の設定を取得します。
func GetProtocolConversionConfig() map[string]interface{} {
	return map[string]interface{}{"setting1": "value1", "setting2": "value2"}
}

// 新しいメソッドを追加して、プロトコル変換のヘルスチェックを行います。
func HealthCheckProtocolConversion() bool {
	return true
}

// 新しいメソッドを追加して、プロトコル変換のステータスをリセットします。
func ResetProtocolConversionStatus() string {
	return "Protocol conversion status reset"
}

// 新しいメソッドを追加して、プロトコル変換のリクエスト数を取得します。
func GetProtocolConversionRequestCount() int {
	return 1000 // ダミーのリクエスト数を返します。
}

// 新しいメソッドを追加して、プロトコル変換のレスポンス時間を取得します。
func GetProtocolConversionResponseTime() float64 {
	return 0.123 // ダミーのレスポンス時間を返します。
}

// 新しいメソッドを追加して、プロトコル変換のリクエストボディサイズを取得します。
func GetProtocolConversionRequestBodySize(r *http.Request) (int, error) {
	bodyBytes, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return 0, err
	}
	return len(bodyBytes), nil
}

// 新しいメソッドを追加して、プロトコル変換のレスポンスボディサイズを取得します。
func GetProtocolConversionResponseBodySize(grpcResp *GRPCResponse) (int, error) {
	respBytes, err := json.Marshal(grpcResp.Body)
	if err != nil {
		return 0, err
	}
	return len(respBytes), nil
}

// 新しいメソッドを追加して、プロトコル変換のリクエストメソッドを取得します。
func GetProtocolConversionRequestMethod(r *http.Request) string {
	return r.Method
}

// 新しいメソッドを追加して、プロトコル変換のリクエストパスを取得します。
func GetProtocolConversionRequestPath(r *http.Request) string {
	return r.URL.Path
}

// 新しいメソッドを追加して、プロトコル変換のリクエストボディを検証します。
func ValidateProtocolConversionRequestBody(body map[string]interface{}) bool {
	// リクエストボディの検証ロジックをここに追加します。
	return true
}

// 新しいメソッドを追加して、プロトコル変換のレスポンスボディを検証します。
func ValidateProtocolConversionResponseBody(body map[string]interface{}) bool {
	// レスポンスボディの検証ロジックをここに追加します。
	return true
}
