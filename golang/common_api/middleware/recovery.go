package middleware

import (
	"log"
	"net/http"
	"runtime/debug"
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
