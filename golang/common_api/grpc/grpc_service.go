package grpc

import (
	"context"
	"log"
)

// GRPCService は gRPCサービスの基底となる構造体です。
// 実際のサービスロジックはこの構造体を拡張して実装してください。
type GRPCService struct {
	// 必要なフィールドを追加
}

// NewGRPCService は新しい gRPCサービスのインスタンスを作成します。
func NewGRPCService() *GRPCService {
	return &GRPCService{}
}

// DoSomething は gRPCサービスのサンプルメソッドです。
// 実際の処理内容に応じて実装を変更してください。
func (s *GRPCService) DoSomething(ctx context.Context, request interface{}) (interface{}, error) {
	log.Println("DoSomething メソッドが呼び出されました")
	// ビジネスロジックをここに実装
	return nil, nil
}
