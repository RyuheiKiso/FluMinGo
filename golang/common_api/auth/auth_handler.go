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

// ユーザーのトークンをすべて削除するメソッドを追加
func (h *AuthHandler) HandleDeleteAllTokens(w http.ResponseWriter, r *http.Request) {
	var req struct {
		Username string `json:"username"`
	}
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		h.logger.Error("Invalid request")
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	if err := h.Service.DeleteAllTokens(req.Username); err != nil {
		h.logger.Error("Failed to delete all tokens")
		http.Error(w, "Failed to delete all tokens", http.StatusInternalServerError)
		return
	}
	h.logger.Info("Deleted all tokens for user: " + req.Username)
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Deleted all tokens"))
}

// HandlePasswordReset はパスワードリセットリクエストを処理します。
func (h *AuthHandler) HandlePasswordReset(w http.ResponseWriter, r *http.Request) {
	var req struct {
		Username    string `json:"username"`
		NewPassword string `json:"new_password"`
	}
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		h.logger.Error("Invalid request")
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	if err := h.Service.ResetPassword(req.Username, req.NewPassword); err != nil {
		h.logger.Error("Password reset failed")
		http.Error(w, "Password reset failed", http.StatusInternalServerError)
		return
	}
	h.logger.Info("Password reset successful for user: " + req.Username)
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Password reset successful"))
}

// HandleTokenRefresh はトークンリフレッシュリクエストを処理します。
func (h *AuthHandler) HandleTokenRefresh(w http.ResponseWriter, r *http.Request) {
	var req struct {
		Token string `json:"token"`
	}
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		h.logger.Error("Invalid request")
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	newToken, err := h.Service.RefreshToken(req.Token)
	if err != nil {
		h.logger.Error("Token refresh failed")
		http.Error(w, "Token refresh failed", http.StatusUnauthorized)
		return
	}
	h.logger.Info("Token refreshed")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(newToken))
}

// Exported LoginHandler to be used by main.go for handling login requests.
var LoginHandler = NewAuthHandler(NewAuthService(NewDummyAuthRepository(), time.Hour, common.NewLogger(), common.NewErrorHandler()), common.NewLogger()).HandleAuthentication
