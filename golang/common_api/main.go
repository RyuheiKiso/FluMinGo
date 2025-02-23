package main

import (
	"log"
	"net/http"

	"FluMinGo/golang/common_api/auth"
)

func main() {
	http.HandleFunc("/login", auth.LoginHandler)
	http.HandleFunc("/health", healthHandler)

	log.Println("Common API server is running on port 8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("OK"))
}
