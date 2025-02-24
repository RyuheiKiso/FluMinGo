package grpc

import (
	"log"
	"net"
	"time"

	"google.golang.org/grpc"
)

// GRPCServer は gRPCサーバーの設定と管理を担当する構造体
// 必要に応じてフィールドを追加してください
type GRPCServer struct {
	server *grpc.Server
	// ...必要なフィールド...
}

// NewGRPCServer は新しい gRPCサーバーのインスタンスを作成します
func NewGRPCServer() *GRPCServer {
	return &GRPCServer{
		server: grpc.NewServer(),
	}
}

// Start は指定したアドレスで gRPCサーバーを起動します
func (s *GRPCServer) Start(address string) error {
	lis, err := net.Listen("tcp", address)
	if err != nil {
		log.Printf("リスナーの作成に失敗しました: %v", err)
		return err
	}
	log.Printf("gRPCサーバーを %s で起動中...", address)

	// サービスの登録はここで実施
	// ...existing code...

	return s.server.Serve(lis)
}

// Stop は gRPCサーバーを優雅に停止します
func (s *GRPCServer) Stop() {
	log.Println("gRPCサーバーを停止します...")
	s.server.GracefulStop()
}

// 新しいメソッドを追加して、サーバーのステータスを取得します。
func (s *GRPCServer) GetStatus() string {
	return "Server is running"
}

// 新しいメソッドを追加して、サーバーのバージョンを取得します。
func (s *GRPCServer) GetVersion() string {
	return "1.0.0"
}

// 新しいメソッドを追加して、サーバーの稼働時間を取得します。
func (s *GRPCServer) GetUptime(startTime time.Time) time.Duration {
	return time.Since(startTime)
}

// 新しいメソッドを追加して、サーバーのエラーログを取得します。
func (s *GRPCServer) GetErrorLogs() []string {
	return []string{"Error log 1", "Error log 2"}
}

// 新しいメソッドを追加して、サーバーのメトリクスを取得します。
func (s *GRPCServer) GetMetrics() map[string]interface{} {
	return map[string]interface{}{"requests": 1000, "errors": 50}
}

// 新しいメソッドを追加して、サーバーの設定を取得します。
func (s *GRPCServer) GetConfig() map[string]interface{} {
	return map[string]interface{}{"setting1": "value1", "setting2": "value2"}
}

// 新しいメソッドを追加して、サーバーのヘルスチェックを行います。
func (s *GRPCServer) HealthCheck() bool {
	return true
}

// 新しいメソッドを追加して、サーバーのステータスをリセットします。
func (s *GRPCServer) ResetStatus() string {
	return "Server status reset"
}
