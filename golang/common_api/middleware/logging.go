package middleware

import (
	"bytes"
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

// ログミドルウェア：各リクエストの情報をログ出力する
func LoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		startTime := time.Now()
		log.Printf("開始: %s %s", r.Method, r.RequestURI)

		// 後続のハンドラーを実行
		next.ServeHTTP(w, r)

		log.Printf("完了: %s %s, 処理時間: %v", r.Method, r.RequestURI, time.Since(startTime))
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
			http.Error(w, "認証情報が必要です", http.StatusUnauthorized)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのIPアドレスをログ出力するミドルウェア
func IPLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		ip := r.RemoteAddr
		log.Printf("IPアドレス: %s", ip)
		next.ServeHTTP(w, r)
	})
}

// リクエストのユーザーエージェントをログ出力するミドルウェア
func UserAgentLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		userAgent := r.UserAgent()
		log.Printf("ユーザーエージェント: %s", userAgent)
		next.ServeHTTP(w, r)
	})
}

// リクエストのサイズをログ出力するミドルウェア
func RequestSizeLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		size := r.ContentLength
		log.Printf("リクエストサイズ: %d bytes", size)
		next.ServeHTTP(w, r)
	})
}

// リクエストのメソッドをログ出力するミドルウェア
func RequestMethodLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		method := r.Method
		log.Printf("リクエストメソッド: %s", method)
		next.ServeHTTP(w, r)
	})
}

// リクエストの言語をログ出力するミドルウェア
func LanguageLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		language := r.Header.Get("Accept-Language")
		log.Printf("リクエスト言語: %s", language)
		next.ServeHTTP(w, r)
	})
}

// リクエストのリファラーをログ出力するミドルウェア
func ReferrerLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		referrer := r.Referer()
		log.Printf("リクエストリファラー: %s", referrer)
		next.ServeHTTP(w, r)
	})
}

// リクエストのプロトコルをログ出力するミドルウェア
func ProtocolLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		protocol := r.Proto
		log.Printf("リクエストプロトコル: %s", protocol)
		next.ServeHTTP(w, r)
	})
}

// リクエストのホストをログ出力するミドルウェア
func HostLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		host := r.Host
		log.Printf("リクエストホスト: %s", host)
		next.ServeHTTP(w, r)
	})
}

// リクエストのヘッダーを検証するミドルウェア
func ValidateHeadersMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("X-Custom-Header") == "" {
			http.Error(w, "X-Custom-Headerが必要です", http.StatusBadRequest)
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
			log.Printf("リクエストボディの読み取りエラー: %v", err)
		} else {
			size := len(body)
			log.Printf("リクエストボディサイズ: %d bytes", size)
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
			http.Error(w, "リクエストボディが無効です", http.StatusBadRequest)
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
			http.Error(w, "X-Request-IDヘッダーが必要です", http.StatusBadRequest)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// リクエストのパスをログ出力するミドルウェア
func RequestPathLoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		path := r.URL.Path
		log.Printf("リクエストパス: %s", path)
		next.ServeHTTP(w, r)
	})
}

// リクエストのクエリパラメータを検証するミドルウェア
func ValidateQueryParamsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Query().Get("required_param") == "" {
			http.Error(w, "required_paramが必要です", http.StatusBadRequest)
			return
		}
		next.ServeHTTP(w, r)
	})
}
