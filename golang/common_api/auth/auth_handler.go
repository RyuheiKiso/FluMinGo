// Package auth handles authentication-related HTTP requests.
package auth

import (
	"encoding/json"
	"net/http"
	"time"

	"FluMinGo/golang/common_api/common"
)

// AuthHandler handles HTTP requests for authentication.
type AuthHandler struct {
	Service Authenticator
	logger  common.Logger
}

// NewAuthHandler creates a new AuthHandler.
func NewAuthHandler(service Authenticator, logger common.Logger) *AuthHandler {
	return &AuthHandler{Service: service, logger: logger}
}

// HandleAuthentication processes auth requests.
func (h *AuthHandler) HandleAuthentication(w http.ResponseWriter, r *http.Request) {
	var req struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}

	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		h.logger.Error("Invalid request")
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}

	ok, err := h.Service.Authenticate(req.Username, req.Password)
	if err != nil || !ok {
		h.logger.Error("Authentication failed")
		http.Error(w, "Authentication failed", http.StatusUnauthorized)
		return
	}

	h.logger.Info("Authenticated")
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
		h.logger.Error("Invalid request")
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	token, err := h.Service.Login(req.Username, req.Password)
	if err != nil {
		h.logger.Error("Authentication failed")
		http.Error(w, "Authentication failed", http.StatusUnauthorized)
		return
	}
	h.logger.Info("Authenticated")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(token))
}

// HandleLogout はログアウトリクエストを処理します。
func (h *AuthHandler) HandleLogout(w http.ResponseWriter, r *http.Request) {
	var req struct {
		Token string `json:"token"`
	}
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		h.logger.Error("Invalid request")
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	if err := h.Service.Logout(req.Token); err != nil {
		h.logger.Error("Logout failed")
		http.Error(w, "Logout failed", http.StatusUnauthorized)
		return
	}
	h.logger.Info("Logged out")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Logged out"))
}

// Exported LoginHandler to be used by main.go for handling login requests.
var LoginHandler = NewAuthHandler(NewAuthService(NewDummyAuthRepository(), time.Hour, common.NewLogger(), common.NewErrorHandler()), common.NewLogger()).HandleAuthentication
