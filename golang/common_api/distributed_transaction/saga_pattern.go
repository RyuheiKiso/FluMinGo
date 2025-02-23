package distributed_transaction

import (
	"context"
	"log"
)

// Sagaパターンによる分散トランザクション管理
// 各ステップの状態を管理し、失敗時にはロールバックを行う

type SagaStep interface {
	Execute(ctx context.Context) error
	Rollback(ctx context.Context) error
}

type Saga struct {
	steps []SagaStep
}

func NewSaga(steps []SagaStep) *Saga {
	return &Saga{steps: steps}
}

func (s *Saga) Execute(ctx context.Context) error {
	for _, step := range s.steps {
		if err := step.Execute(ctx); err != nil {
			log.Printf("Step failed: %v", err)
			s.rollback(ctx)
			return err
		}
	}
	return nil
}

func (s *Saga) rollback(ctx context.Context) {
	for i := len(s.steps) - 1; i >= 0; i-- {
		if err := s.steps[i].Rollback(ctx); err != nil {
			log.Printf("Rollback failed: %v", err)
		}
	}
}
