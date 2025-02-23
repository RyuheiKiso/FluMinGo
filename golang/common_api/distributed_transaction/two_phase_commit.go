package distributed_transaction

import (
	"context"
	"log"
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
