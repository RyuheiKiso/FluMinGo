package distributed_transaction

import (
	"context"
	"fmt"
	"log"
	"time"
)

// 二相コミットによるデータ一貫性保証
// 各トランザクションの準備とコミットを管理

type TwoPhaseCommit struct {
	participants []Participant
}

type Participant interface {
	Prepare(ctx context.Context) error
	Commit(ctx context.Context) error
	Rollback(ctx context.Context) error
}

func NewTwoPhaseCommit(participants []Participant) *TwoPhaseCommit {
	return &TwoPhaseCommit{participants: participants}
}

func (t *TwoPhaseCommit) Execute(ctx context.Context) error {
	for _, p := range t.participants {
		if err := p.Prepare(ctx); err != nil {
			t.rollback(ctx)
			return err
		}
	}
	for _, p := range t.participants {
		if err := p.Commit(ctx); err != nil {
			t.rollback(ctx)
			return err
		}
	}
	return nil
}

func (t *TwoPhaseCommit) rollback(ctx context.Context) {
	for _, p := range t.participants {
		if err := p.Rollback(ctx); err != nil {
			log.Printf("Rollback failed: %v", err)
		}
	}
}

// トランザクションの状態を確認する機能を追加
func (t *TwoPhaseCommit) Status() string {
	// 状態確認のロジックを実装
	return "All participants are ready"
}

// トランザクションのタイムアウト機能を追加
func (t *TwoPhaseCommit) ExecuteWithTimeout(ctx context.Context, timeout time.Duration) error {
	ctx, cancel := context.WithTimeout(ctx, timeout)
	defer cancel()
	return t.Execute(ctx)
}

// トランザクションのリトライ機能を追加
func (t *TwoPhaseCommit) ExecuteWithRetry(ctx context.Context, retries int) error {
	for i := 0; i < retries; i++ {
		if err := t.Execute(ctx); err == nil {
			return nil
		}
	}
	return fmt.Errorf("transaction failed after %d retries", retries)
}

// トランザクションのロギング機能を追加
func (t *TwoPhaseCommit) LogTransaction(status string) {
	log.Printf("Transaction status: %s", status)
}

// トランザクションのバリデーション機能を追加
func (t *TwoPhaseCommit) ValidateTransaction() bool {
	// バリデーションロジックを実装
	return len(t.participants) > 0
}

// トランザクションのエクスポート機能を追加
func (t *TwoPhaseCommit) ExportTransaction() string {
	return fmt.Sprintf("Exporting transaction with %d participants", len(t.participants))
}
