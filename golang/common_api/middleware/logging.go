package middleware

import (
	"bytes"
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

// ロギングミドルウェアの実装
// ログミドルウェア：各リクエストの情報をログ出力する
func LoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		startTime := time.Now()
		log.Printf("Start: %s %s", r.Method, r.RequestURI)
		// Execute the next handler
		next.ServeHTTP(w, r)
		log.Printf("Completed: %s %s, Duration: %v", r.Method, r.RequestURI, time.Since(startTime))
	})
}

// JSONレスポンスミドルウェア：レスポンスをJSON形式に変換する
func JSONResponseMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		next.ServeHTTP(w, r)
	})
}

// 認証ミドルウェア：リクエストに認証情報が含まれているかを確認する
func AuthMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Authorization") == "" {
			http.Error(w, "Authorization required", http.StatusUnauthorized)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのIPアドレスをログ出力するミドルウェア
func IPLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("IP Address: %s", r.RemoteAddr)
		next.ServeHTTP(w, r)
	})
}

// リクエストのユーザーエージェントをログ出力するミドルウェア
func UserAgentLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("User Agent: %s", r.UserAgent())
		next.ServeHTTP(w, r)
	})
}

// リクエストのサイズをログ出力するミドルウェア
func RequestSizeLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Request Size: %d bytes", r.ContentLength)
		next.ServeHTTP(w, r)
	})
}

// リクエストのメソッドをログ出力するミドルウェア
func RequestMethodLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Request Method: %s", r.Method)
		next.ServeHTTP(w, r)
	})
}

// リクエストの言語をログ出力するミドルウェア
func LanguageLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Request Language: %s", r.Header.Get("Accept-Language"))
		next.ServeHTTP(w, r)
	})
}

// リクエストのリファラーをログ出力するミドルウェア
func ReferrerLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Request Referrer: %s", r.Referer())
		next.ServeHTTP(w, r)
	})
}

// リクエストのプロトコルをログ出力するミドルウェア
func ProtocolLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Request Protocol: %s", r.Proto)
		next.ServeHTTP(w, r)
	})
}

// リクエストのホストをログ出力するミドルウェア
func HostLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Request Host: %s", r.Host)
		next.ServeHTTP(w, r)
	})
}

// リクエストのヘッダーを検証するミドルウェア
func ValidateHeadersMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("X-Custom-Header") == "" {
			http.Error(w, "X-Custom-Header required", http.StatusBadRequest)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのボディサイズをログ出力するミドルウェア
func RequestBodySizeLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			log.Printf("Error reading request body: %v", err)
		} else {
			log.Printf("Request Body Size: %d bytes", len(body))
			r.Body = ioutil.NopCloser(bytes.NewBuffer(body))
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのボディを検証するミドルウェア
func ValidateRequestBodyMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil || len(body) == 0 {
			http.Error(w, "Invalid request body", http.StatusBadRequest)
			return
		}
		r.Body = ioutil.NopCloser(bytes.NewBuffer(body))
		next.ServeHTTP(w, r)
	})
}

// リクエストのヘッダーを検証するミドルウェア
func ValidateRequestHeadersMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("X-Request-ID") == "" {
			http.Error(w, "X-Request-ID header required", http.StatusBadRequest)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのパスをログ出力するミドルウェア
func RequestPathLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Request Path: %s", r.URL.Path)
		next.ServeHTTP(w, r)
	})
}

// リクエストのクエリパラメータを検証するミドルウェア
func ValidateQueryParamsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Query().Get("required_param") == "" {
			http.Error(w, "required_param required", http.StatusBadRequest)
			return
		}
		next.ServeHTTP(w, r)
	})
}
