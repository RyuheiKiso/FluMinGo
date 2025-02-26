package resilience

import (
	"errors"
	"sync"
	"time"
)

// サーキットブレーカーの状態を示す型
const (
	StateClosed   = iota // 通常状態
	StateOpen            // ブレーカーが開いた状態
	StateHalfOpen        // 半開状態：リセット待ち
)

// サーキットブレーカーの実装
// CircuitBreaker は、一定のエラー閾値を超えた場合に操作を遮断するサーキットブレーカーの実装です。
// エラーが続く場合に、システム全体の負荷を軽減する目的で使用されます。

type CircuitBreaker struct {
	mu               sync.Mutex
	state            int           // 現在の状態
	failureCount     int           // 連続失敗回数
	failureThreshold int           // 失敗閾値
	resetTimeout     time.Duration // 状態をリセットするまでの時間
	lastFailureTime  time.Time     // 最後の失敗時刻
}

// NewCircuitBreaker は新しいサーキットブレーカーを初期化します。
func NewCircuitBreaker(threshold int, timeout time.Duration) *CircuitBreaker {
	return &CircuitBreaker{
		state:            StateClosed,
		failureThreshold: threshold,
		resetTimeout:     timeout,
	}
}

// Execute は、指定された操作をサーキットブレーカーの管理下で実行します。
// ブレーカーがオープン状態の場合はエラーを返します。
func (cb *CircuitBreaker) Execute(operation func() error) error {
	cb.mu.Lock()
	defer cb.mu.Unlock()

	// オープン状態の場合、リセットタイムアウトを検証
	if cb.state == StateOpen {
		if time.Since(cb.lastFailureTime) < cb.resetTimeout {
			return errors.New("CircuitBreaker is open")
		} else {
			cb.state = StateHalfOpen
		}
	}

	// 操作を実行
	err := operation()
	if err != nil {
		cb.failureCount++
		cb.lastFailureTime = time.Now()
		if cb.failureCount >= cb.failureThreshold {
			cb.state = StateOpen
		}
		return err
	}

	// 操作成功時は状態をリセット
	cb.failureCount = 0
	cb.state = StateClosed
	return nil
}
