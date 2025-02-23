package middleware

import (
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
