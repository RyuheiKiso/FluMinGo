package restapi

import (
	"log"
	"net/http"
	"strings"
)

// REST APIバージョニングの実装
// VersioningMiddleware は API バージョンに基づいたルーティングを行うミドルウェアです。
// リクエスト URL にバージョン情報が含まれていない場合、デフォルトのバージョン (v1) を適用します。
func VersioningMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		path := r.URL.Path
		segments := strings.Split(path, "/")
		if len(segments) < 2 || (len(segments) >= 2 && !strings.HasPrefix(segments[1], "v")) {
			// URL にバージョンが含まれていない場合、'/v1' を先頭に追加する
			r.URL.Path = "/v1" + path
		}
		next.ServeHTTP(w, r)
	})
}

// LoggingMiddleware はリクエストのログを記録するミドルウェアです。
func LoggingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Printf("%s %s", r.Method, r.URL.Path)
		next.ServeHTTP(w, r)
	})
}

// VersionValidationMiddleware はバージョンの検証を行うミドルウェアです。
func VersionValidationMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		path := r.URL.Path
		segments := strings.Split(path, "/")
		if len(segments) >= 2 && strings.HasPrefix(segments[1], "v") {
			version := segments[1]
			if version != "v1" && version != "v2" {
				http.Error(w, "Unsupported API version", http.StatusBadRequest)
				return
			}
		}
		next.ServeHTTP(w, r)
	})
}

// 新機能: 認証ミドルウェアの追加
func AuthenticationMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		token := r.Header.Get("Authorization")
		if token == "" {
			http.Error(w, "Authorization token required", http.StatusUnauthorized)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// 新機能: CORSミドルウェアの追加
func CORSMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")
		if r.Method == "OPTIONS" {
			w.WriteHeader(http.StatusNoContent)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// 新機能: RequestIDミドルウェアの追加
func RequestIDMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// 簡易的なリクエストIDを設定（本番環境ではUUIDなどの利用が推奨されます）
		reqID := "req-12345"
		w.Header().Set("X-Request-ID", reqID)
		next.ServeHTTP(w, r)
	})
}

// 新機能: Rate Limitミドルウェアの追加
func RateLimitMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// 簡易的なレート制限チェック（実際の実装には外部ライブラリなどを利用するのが望ましいです）
		if r.Header.Get("X-RateLimit-Test") == "deny" {
			http.Error(w, "Rate limit exceeded", http.StatusTooManyRequests)
			return
		}
		next.ServeHTTP(w, r)
	})
}

// 新機能: RecoveryMiddleware を追加
func RecoveryMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		defer func() {
			if err := recover(); err != nil {
				log.Printf("パニックを回復: %v", err)
				http.Error(w, "内部サーバーエラー", http.StatusInternalServerError)
			}
		}()
		next.ServeHTTP(w, r)
	})
}

// 新機能: SecurityHeadersMiddleware を追加
func SecurityHeadersMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("X-Content-Type-Options", "nosniff")
		w.Header().Set("X-Frame-Options", "DENY")
		w.Header().Set("X-XSS-Protection", "1; mode=block")
		next.ServeHTTP(w, r)
	})
}

// 新機能: TracingMiddleware を追加
func TracingMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// 簡単なトレースID設定（実際はUUIDなどの利用が推奨されます）
		traceID := "trace-00001"
		w.Header().Set("X-Trace-ID", traceID)
		next.ServeHTTP(w, r)
	})
}

// 新機能: NoCacheMiddleware を追加
func NoCacheMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Cache-Control", "no-store, no-cache, must-revalidate")
		next.ServeHTTP(w, r)
	})
}
