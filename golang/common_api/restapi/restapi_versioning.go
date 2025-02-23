package restapi

import (
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
