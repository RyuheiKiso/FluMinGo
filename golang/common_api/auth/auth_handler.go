// Package auth handles authentication-related HTTP requests.
package auth

import (
	"encoding/json"
	"net/http"
	"time"
)

// AuthHandler handles HTTP requests for authentication.
type AuthHandler struct {
	Service Authenticator
}

// NewAuthHandler creates a new AuthHandler.
func NewAuthHandler(service Authenticator) *AuthHandler {
	return &AuthHandler{Service: service}
}

// HandleAuthentication processes auth requests.
func (h *AuthHandler) HandleAuthentication(w http.ResponseWriter, r *http.Request) {
	var req struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}

	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}

	ok, err := h.Service.Authenticate(req.Username, req.Password)
	if err != nil || !ok {
		http.Error(w, "Authentication failed", http.StatusUnauthorized)
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Authenticated"))
}

// HandleLogin はログインリクエストを処理します。
func (h *AuthHandler) HandleLogin(w http.ResponseWriter, r *http.Request) {
	var req struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	token, err := h.Service.Login(req.Username, req.Password)
	if err != nil {
		http.Error(w, "Authentication failed", http.StatusUnauthorized)
		return
	}
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(token))
}

// HandleLogout はログアウトリクエストを処理します。
func (h *AuthHandler) HandleLogout(w http.ResponseWriter, r *http.Request) {
	var req struct {
		Token string `json:"token"`
	}
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	if err := h.Service.Logout(req.Token); err != nil {
		http.Error(w, "Logout failed", http.StatusUnauthorized)
		return
	}
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Logged out"))
}

// Exported LoginHandler to be used by main.go for handling login requests.
var LoginHandler = NewAuthHandler(NewAuthService(NewDummyAuthRepository(), time.Hour)).HandleAuthentication
