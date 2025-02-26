// main.go ファイル
// このファイルは、Common APIサーバーのエントリーポイントを提供します。

package main

import (
	"FluMinGo/golang/common_api/auth"
	"log"
	"net/http"
)

// setupRoutes 関数
// HTTPルートを設定し、ServeMuxを返します。
func setupRoutes() *http.ServeMux {
	mux := http.NewServeMux()
	mux.HandleFunc("/login", auth.LoginHandler)
	mux.HandleFunc("/health", healthHandler)
	return mux
}

// startServer 関数
// 指定したServeMuxでHTTPサーバを起動します。
func startServer(mux *http.ServeMux) {
	port := "8080"
	log.Printf("Common API server is running on port %s", port)
	if err := http.ListenAndServe(":"+port, mux); err != nil {
		log.Fatal(err)
	}
}

// main 関数
// アプリケーションのエントリーポイントです。
func main() {
	mux := setupRoutes()
	startServer(mux)
}

// healthHandler 関数
// シンプルなOKメッセージで応答します。
func healthHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("OK"))
}
