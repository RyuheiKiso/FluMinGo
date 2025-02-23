package resilience

import (
	"errors"
	"time"
)

// FaultTolerance はフォールトトレランス機能を提供する構造体です。
// リトライ処理と障害時のフォールバック処理を実装します。

type FaultTolerance struct {
	RetryCount    int           // リトライ回数
	RetryInterval time.Duration // リトライ間隔
}

// NewFaultTolerance は FaultTolerance を初期化する関数です。
func NewFaultTolerance(retryCount int, retryInterval time.Duration) *FaultTolerance {
	return &FaultTolerance{
		RetryCount:    retryCount,
		RetryInterval: retryInterval,
	}
}

// Execute は指定された処理を実行します。
// 処理がエラーの場合、リトライ処理を行い、全て失敗した場合にフォールバック関数を呼び出します。
func (ft *FaultTolerance) Execute(operation func() (interface{}, error), fallback func(error) interface{}) (interface{}, error) {
	var result interface{}
	var err error

	// リトライ処理
	for i := 0; i <= ft.RetryCount; i++ {
		result, err = operation()
		if err == nil {
			return result, nil
		}

		// 最後の試行でなければ、リトライ間隔を待機
		if i < ft.RetryCount {
			time.Sleep(ft.RetryInterval)
		}
	}

	// 全てのリトライが失敗した場合、フォールバックが提供されていればそれを実行
	if fallback != nil {
		return fallback(err), nil
	}

	return nil, errors.New("リトライを試行しましたが、処理が失敗し、フォールバック処理も提供されていません")
}
