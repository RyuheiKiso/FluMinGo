package restapi

import (
	"encoding/json"
	"net/http"
)

// REST APIハンドラーの実装
// REST API ハンドラー：リクエストを受け取りサービス層へ処理を委譲する
// サンプルとしてメッセージ取得エンドポイントを実装

// Handler manages REST API endpoints.
type Handler struct {
	Service *Service
}

// NewHandler creates a new Handler instance.
func NewHandler(service *Service) *Handler {
	return &Handler{Service: service}
}

// MessageHandler handles the sample endpoint, retrieves a message from the service, and returns it as JSON.
func (h *Handler) MessageHandler(w http.ResponseWriter, r *http.Request) {
	msg, err := h.Service.GetMessage()
	if err != nil {
		http.Error(w, "Error occurred", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"message": msg}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// VersionHandler retrieves the API version from the service and returns it as JSON.
func (h *Handler) VersionHandler(w http.ResponseWriter, r *http.Request) {
	version, err := h.Service.GetVersion()
	if err != nil {
		http.Error(w, "Error occurred", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"version": version}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// StatusHandler retrieves the API status from the service and returns it as JSON.
func (h *Handler) StatusHandler(w http.ResponseWriter, r *http.Request) {
	status, err := h.Service.GetStatus()
	if err != nil {
		http.Error(w, "Error occurred", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"status": status}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// UserHandler retrieves user information from the service and returns it as JSON.
func (h *Handler) UserHandler(w http.ResponseWriter, r *http.Request) {
	user, err := h.Service.GetUser()
	if err != nil {
		http.Error(w, "Failed to retrieve user information", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"user": user}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// ServerTimeHandler retrieves the current server time from the service and returns it as JSON.
func (h *Handler) ServerTimeHandler(w http.ResponseWriter, r *http.Request) {
	timeStr, err := h.Service.GetServerTime()
	if err != nil {
		http.Error(w, "Failed to retrieve server time", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"server_time": timeStr}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// HealthCheckHandler retrieves health check information from the service and returns it as JSON.
func (h *Handler) HealthCheckHandler(w http.ResponseWriter, r *http.Request) {
	health, err := h.Service.GetHealthCheck()
	if err != nil {
		http.Error(w, "Failed to retrieve health check information", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"health": health}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// UptimeHandler retrieves the service uptime from the service and returns it as JSON.
func (h *Handler) UptimeHandler(w http.ResponseWriter, r *http.Request) {
	uptime, err := h.Service.GetUptime()
	if err != nil {
		http.Error(w, "Failed to retrieve uptime", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"uptime": uptime}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// SystemInfoHandler retrieves system information from the service and returns it as JSON.
func (h *Handler) SystemInfoHandler(w http.ResponseWriter, r *http.Request) {
	info, err := h.Service.GetSystemInfo()
	if err != nil {
		http.Error(w, "Failed to retrieve system information", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"system_info": info}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// PingHandler retrieves a pong response from the service and returns it as JSON.
func (h *Handler) PingHandler(w http.ResponseWriter, r *http.Request) {
	pong, err := h.Service.Ping()
	if err != nil {
		http.Error(w, "Failed to retrieve pong response", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"pong": pong}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}
