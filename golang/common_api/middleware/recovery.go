package middleware

import (
	"bytes"
	"context"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"runtime/debug"
	"time"
)

// リカバリミドルウェア：パニック発生時にリカバリしてエラーログを出力する
func RecoveryMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		defer func() {
			if err := recover(); err != nil {
				log.Printf("パニック回復: %v\nスタックトレース:\n%s", err, debug.Stack())
				http.Error(w, "内部サーバーエラー", http.StatusInternalServerError)
			}
		}()
		next.ServeHTTP(w, r)
	})
}

// CORSミドルウェア：CORSヘッダーを設定する
func CORSMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")
		if r.Method == http.MethodOptions {
			w.WriteHeader(http.StatusOK)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストIDミドルウェア：各リクエストに一意のIDを付与する
func RequestIDMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		requestID := r.Header.Get("X-Request-ID")
		if requestID == "" {
			requestID = generateRequestID()
		}
		w.Header().Set("X-Request-ID", requestID)
		next.ServeHTTP(w, r)
	})
}

// 一意のリクエストIDを生成するヘルパー関数
func generateRequestID() string {
	return fmt.Sprintf("req-%d", time.Now().UnixNano())
}

// リクエストのタイムアウトを設定するミドルウェア
func TimeoutMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		ctx := r.Context()
		ctx, cancel := context.WithTimeout(ctx, 5*time.Second)
		defer cancel()
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}

// リクエストのサイズを制限するミドルウェア
func MaxRequestSizeMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		r.Body = http.MaxBytesReader(w, r.Body, 1048576) // 1MB
		next.ServeHTTP(w, r)
	})
}

// リクエストのヘッダーをログ出力するミドルウェア
func RequestHeadersLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		headers := r.Header
		for name, values := range headers {
			for _, value := range values {
				log.Printf("ヘッダー: %s=%s", name, value)
			}
		}
		next.ServeHTTP(w, r)
	})
}

// レスポンスのステータスコードをログ出力するミドルウェア
func ResponseStatusLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		recorder := &statusRecorder{ResponseWriter: w, statusCode: http.StatusOK}
		next.ServeHTTP(recorder, r)
		log.Printf("レスポンスステータス: %d", recorder.statusCode)
	})
}

// レスポンスのステータスコードを記録するためのヘルパー構造体
type statusRecorder struct {
	http.ResponseWriter
	statusCode int
}

func (rec *statusRecorder) WriteHeader(code int) {
	rec.statusCode = code
	rec.ResponseWriter.WriteHeader(code)
}

// リクエストのクエリパラメータをログ出力するミドルウェア
func QueryParamsLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		queryParams := r.URL.Query()
		for name, values := range queryParams {
			for _, value := range values {
				log.Printf("クエリパラメータ: %s=%s", name, value)
			}
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのボディをログ出力するミドルウェア
func RequestBodyLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			log.Printf("リクエストボディの読み取りエラー: %v", err)
		} else {
			log.Printf("リクエストボディ: %s", string(body))
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのクッキーをログ出力するミドルウェア
func CookiesLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		cookies := r.Cookies()
		for _, cookie := range cookies {
			log.Printf("クッキー: %s=%s", cookie.Name, cookie.Value)
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのタイムスタンプをログ出力するミドルウェア
func TimestampLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		timestamp := time.Now().Format(time.RFC3339)
		log.Printf("リクエストタイムスタンプ: %s", timestamp)
		next.ServeHTTP(w, r)
	})
}

// リクエストのIPアドレスを制限するミドルウェア
func IPRestrictionMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		allowedIP := "192.168.1.1"
		if r.RemoteAddr != allowedIP {
			http.Error(w, "アクセスが許可されていません", http.StatusForbidden)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのメソッドを制限するミドルウェア
func MethodRestrictionMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		allowedMethods := []string{http.MethodGet, http.MethodPost}
		methodAllowed := false
		for _, method := range allowedMethods {
			if r.Method == method {
				methodAllowed = true
				break
			}
		}
		if !methodAllowed {
			http.Error(w, "このメソッドは許可されていません", http.StatusMethodNotAllowed)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのボディを暗号化するミドルウェア
func EncryptRequestBodyMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			http.Error(w, "リクエストボディの読み取りエラー", http.StatusBadRequest)
			return
		}
		encryptedBody := encrypt(body)
		r.Body = ioutil.NopCloser(bytes.NewBuffer(encryptedBody))
		next.ServeHTTP(w, r)
	})
}

// リクエストのボディを復号するミドルウェア
func DecryptRequestBodyMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			http.Error(w, "リクエストボディの読み取りエラー", http.StatusBadRequest)
			return
		}
		decryptedBody := decrypt(body)
		r.Body = ioutil.NopCloser(bytes.NewBuffer(decryptedBody))
		next.ServeHTTP(w, r)
	})
}

// リクエストのボディを圧縮するミドルウェア
func CompressRequestBodyMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			http.Error(w, "リクエストボディの読み取りエラー", http.StatusBadRequest)
			return
		}
		compressedBody := compress(body)
		r.Body = ioutil.NopCloser(bytes.NewBuffer(compressedBody))
		next.ServeHTTP(w, r)
	})
}

// リクエストのボディを解凍するミドルウェア
func DecompressRequestBodyMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		body, err := ioutil.ReadAll(r.Body)
		if err != nil {
			http.Error(w, "リクエストボディの読み取りエラー", http.StatusBadRequest)
			return
		}
		decompressedBody := decompress(body)
		r.Body = ioutil.NopCloser(bytes.NewBuffer(decompressedBody))
		next.ServeHTTP(w, r)
	})
}

// 暗号化のヘルパー関数
func encrypt(data []byte) []byte {
	// 暗号化ロジックをここに実装
	return data
}

// 復号のヘルパー関数
func decrypt(data []byte) []byte {
	// 復号ロジックをここに実装
	return data
}

// 圧縮のヘルパー関数
func compress(data []byte) []byte {
	// 圧縮ロジックをここに実装
	return data
}

// 解凍のヘルパー関数
func decompress(data []byte) []byte {
	// 解凍ロジックをここに実装
	return data
}
