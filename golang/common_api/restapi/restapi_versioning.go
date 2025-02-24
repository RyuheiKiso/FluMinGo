package restapi

import (
	"log"
	"net/http"
	"strings"
)

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
