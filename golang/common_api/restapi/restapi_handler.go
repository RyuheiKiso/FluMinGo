package restapi

import (
	"encoding/json"
	"net/http"
)

// REST API ハンドラー：リクエストを受け取りサービス層へ処理を委譲する
// サンプルとしてメッセージ取得エンドポイントを実装

// Handler は REST API のエンドポイントを管理する構造体です
type Handler struct {
	Service *Service
}

// NewHandler は Handler のインスタンスを生成します
func NewHandler(service *Service) *Handler {
	return &Handler{Service: service}
}

// MessageHandler はサンプルのエンドポイントで、サービスからメッセージを取得してJSONで返します
func (h *Handler) MessageHandler(w http.ResponseWriter, r *http.Request) {
	msg, err := h.Service.GetMessage()
	if err != nil {
		http.Error(w, "エラーが発生しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"message": msg}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// VersionHandler は API のバージョンを取得してJSONで返します
func (h *Handler) VersionHandler(w http.ResponseWriter, r *http.Request) {
	version, err := h.Service.GetVersion()
	if err != nil {
		http.Error(w, "エラーが発生しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"version": version}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// StatusHandler は API のステータスを取得してJSONで返します
func (h *Handler) StatusHandler(w http.ResponseWriter, r *http.Request) {
	status, err := h.Service.GetStatus()
	if err != nil {
		http.Error(w, "エラーが発生しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"status": status}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// 新機能: UserHandler はサービスからユーザー情報を取得してJSONで返すエンドポイントです
func (h *Handler) UserHandler(w http.ResponseWriter, r *http.Request) {
	user, err := h.Service.GetUser()
	if err != nil {
		http.Error(w, "ユーザー情報の取得に失敗しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"user": user}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// 新機能: ServerTimeHandler はサービスからサーバーの現在時刻を取得してJSONで返すエンドポイントです
func (h *Handler) ServerTimeHandler(w http.ResponseWriter, r *http.Request) {
	timeStr, err := h.Service.GetServerTime()
	if err != nil {
		http.Error(w, "サーバー時刻の取得に失敗しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"server_time": timeStr}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// 新機能: HealthCheckHandler はサービスからヘルスチェック情報を取得してJSONで返すエンドポイントです
func (h *Handler) HealthCheckHandler(w http.ResponseWriter, r *http.Request) {
	health, err := h.Service.GetHealthCheck()
	if err != nil {
		http.Error(w, "ヘルスチェックの取得に失敗しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"health": health}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// 新機能: UptimeHandler はサービスから稼働時間を取得してJSONで返すエンドポイントです
func (h *Handler) UptimeHandler(w http.ResponseWriter, r *http.Request) {
	uptime, err := h.Service.GetUptime()
	if err != nil {
		http.Error(w, "稼働時間の取得に失敗しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"uptime": uptime}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// 新機能: SystemInfoHandler はサービスからシステム情報を取得してJSONで返すエンドポイントです
func (h *Handler) SystemInfoHandler(w http.ResponseWriter, r *http.Request) {
	info, err := h.Service.GetSystemInfo()
	if err != nil {
		http.Error(w, "システム情報の取得に失敗しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"system_info": info}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}

// 新機能: PingHandler はサービスからポング応答を取得してJSONで返すエンドポイントです
func (h *Handler) PingHandler(w http.ResponseWriter, r *http.Request) {
	pong, err := h.Service.Ping()
	if err != nil {
		http.Error(w, "ポング応答の取得に失敗しました", http.StatusInternalServerError)
		return
	}
	response := map[string]string{"pong": pong}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(response)
}
