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
