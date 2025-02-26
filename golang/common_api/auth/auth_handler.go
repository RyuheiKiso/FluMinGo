// Package auth handles authentication-related HTTP requests.
package auth

import (
	"encoding/json"
	"net/http"
	"time"

	"FluMinGo/golang/common_api/common"
)

// AuthHandler handles authentication-related HTTP requests.
type AuthHandler struct {
	Service Authenticator
	logger  common.Logger
}

// NewAuthHandler creates a new AuthHandler.
func NewAuthHandler(service Authenticator, logger common.Logger) *AuthHandler {
	return &AuthHandler{Service: service, logger: logger}
}

// decodeRequest decodes JSON from the request and logs errors consistently.
func (h *AuthHandler) decodeRequest(r *http.Request, dst interface{}) error {
	err := json.NewDecoder(r.Body).Decode(dst)
	if err != nil {
		h.logger.Error("Invalid request")
	}
	return err
}

// parseCredentials extracts username and password from the request.
func (h *AuthHandler) parseCredentials(r *http.Request) (string, string, error) {
	var req struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}
	if err := h.decodeRequest(r, &req); err != nil {
		return "", "", err
	}
	return req.Username, req.Password, nil
}

// parseToken extracts a token from the request.
func (h *AuthHandler) parseToken(r *http.Request) (string, error) {
	var req struct {
		Token string `json:"token"`
	}
	if err := h.decodeRequest(r, &req); err != nil {
		return "", err
	}
	return req.Token, nil
}

// parseUsername extracts username from the request.
func (h *AuthHandler) parseUsername(r *http.Request) (string, error) {
	var req struct {
		Username string `json:"username"`
	}
	if err := h.decodeRequest(r, &req); err != nil {
		return "", err
	}
	return req.Username, nil
}

// parsePasswordResetRequest extracts username and new password for password reset.
func (h *AuthHandler) parsePasswordResetRequest(r *http.Request) (string, string, error) {
	var req struct {
		Username    string `json:"username"`
		NewPassword string `json:"new_password"`
	}
	if err := h.decodeRequest(r, &req); err != nil {
		return "", "", err
	}
	return req.Username, req.NewPassword, nil
}

// HandleAuthentication processes authentication requests.
func (h *AuthHandler) HandleAuthentication(w http.ResponseWriter, r *http.Request) {
	username, password, err := h.parseCredentials(r)
	if err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	ok, err := h.Service.Authenticate(username, password)
	if err != nil || !ok {
		h.logger.Error("Authentication failed")
		http.Error(w, "Authentication failed", http.StatusUnauthorized)
		return
	}
	h.logger.Info("Authenticated")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Authenticated"))
}

// HandleLogin processes login requests.
func (h *AuthHandler) HandleLogin(w http.ResponseWriter, r *http.Request) {
	username, password, err := h.parseCredentials(r)
	if err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	token, err := h.Service.Login(username, password)
	if err != nil {
		h.logger.Error("Authentication failed")
		http.Error(w, "Authentication failed", http.StatusUnauthorized)
		return
	}
	h.logger.Info("Authenticated")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(token))
}

// HandleLogout processes logout requests.
func (h *AuthHandler) HandleLogout(w http.ResponseWriter, r *http.Request) {
	token, err := h.parseToken(r)
	if err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	if err := h.Service.Logout(token); err != nil {
		h.logger.Error("Logout failed")
		http.Error(w, "Logout failed", http.StatusUnauthorized)
		return
	}
	h.logger.Info("Logged out")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Logged out"))
}

// HandleDeleteAllTokens deletes all tokens for a given user.
func (h *AuthHandler) HandleDeleteAllTokens(w http.ResponseWriter, r *http.Request) {
	username, err := h.parseUsername(r)
	if err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	if err := h.Service.DeleteAllTokens(username); err != nil {
		h.logger.Error("Failed to delete all tokens")
		http.Error(w, "Failed to delete all tokens", http.StatusInternalServerError)
		return
	}
	h.logger.Info("Deleted all tokens for user: " + username)
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Deleted all tokens"))
}

// HandlePasswordReset processes password reset requests.
func (h *AuthHandler) HandlePasswordReset(w http.ResponseWriter, r *http.Request) {
	username, newPassword, err := h.parsePasswordResetRequest(r)
	if err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	if err := h.Service.ResetPassword(username, newPassword); err != nil {
		h.logger.Error("Password reset failed")
		http.Error(w, "Password reset failed", http.StatusInternalServerError)
		return
	}
	h.logger.Info("Password reset successful for user: " + username)
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Password reset successful"))
}

// HandleTokenRefresh processes token refresh requests.
func (h *AuthHandler) HandleTokenRefresh(w http.ResponseWriter, r *http.Request) {
	token, err := h.parseToken(r)
	if err != nil {
		http.Error(w, "Invalid request", http.StatusBadRequest)
		return
	}
	newToken, err := h.Service.RefreshToken(token)
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
var LoginHandler = NewAuthHandler(
	NewAuthService(NewDummyAuthRepository(), time.Hour, common.NewLogger(), common.NewErrorHandler()),
	common.NewLogger(),
).HandleAuthentication
