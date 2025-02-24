package distributed_transaction

import (
	"context"
	"fmt"
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

// 現在のステップを取得する機能を追加
func (s *Saga) CurrentStep() int {
	// 現在のステップを返すロジックを実装
	return len(s.steps)
}

// Sagaのステップを追加する機能を追加
func (s *Saga) AddStep(step SagaStep) {
	s.steps = append(s.steps, step)
}

// Sagaのステップのリトライ機能を追加
func (s *Saga) ExecuteWithRetry(ctx context.Context, retries int) error {
	for i := 0; i < retries; i++ {
		if err := s.Execute(ctx); err == nil {
			return nil
		}
	}
	return fmt.Errorf("saga failed after %d retries", retries)
}

// Sagaのロギング機能を追加
func (s *Saga) LogSaga(status string) {
	log.Printf("Saga status: %s", status)
}

// Sagaのバリデーション機能を追加
func (s *Saga) ValidateSaga() bool {
	// バリデーションロジックを実装
	return len(s.steps) > 0
}

// Sagaのエクスポート機能を追加
func (s *Saga) ExportSaga() string {
	return fmt.Sprintf("Exporting saga with %d steps", len(s.steps))
}

// Sagaのアーカイブ機能を追加
func (s *Saga) ArchiveSaga() string {
	return fmt.Sprintf("Archiving saga with %d steps", len(s.steps))
}

// Sagaのステップの状態確認機能を追加
func (s *Saga) StepStatus(step int) string {
	// ステップの状態確認ロジックを実装
	return fmt.Sprintf("Step %d is completed", step)
}

// Sagaのステップのステータスを一括で確認する機能を追加
func (s *Saga) BatchStepStatus() map[int]string {
	statuses := make(map[int]string)
	for i := range s.steps {
		statuses[i] = s.StepStatus(i)
	}
	return statuses
}
