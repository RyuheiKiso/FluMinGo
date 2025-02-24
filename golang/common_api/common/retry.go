package common

import (
	"time"
)

// Retry retries the provided function fn the specified number of times with the given delay between attempts.
// A callback function is executed after each retry attempt.
func Retry(attempts int, delay time.Duration, fn func() error, callback func(error)) error {
	var err error
	for i := 0; i < attempts; i++ {
		err = fn()
		if err == nil {
			return nil
		}
		callback(err)
		time.Sleep(delay)
	}
	return err
}

// リトライの最大試行回数を設定する機能を追加
func RetryWithMaxAttempts(attempts int, delay time.Duration, maxAttempts int, fn func() error, callback func(error)) error {
	var err error
	for i := 0; i < attempts && i < maxAttempts; i++ {
		err = fn()
		if err == nil {
			return nil
		}
		callback(err)
		time.Sleep(delay)
	}
	return err
}

// 新しい機能: リトライの合計時間を計測する機能を追加
func RetryWithTotalTime(attempts int, delay time.Duration, fn func() error, callback func(error)) (time.Duration, error) {
	var err error
	startTime := time.Now()
	for i := 0; i < attempts; i++ {
		err = fn()
		if err == nil {
			return time.Since(startTime), nil
		}
		callback(err)
		time.Sleep(delay)
	}
	return time.Since(startTime), err
}

// 新しい機能: リトライの合計成功回数を返す機能を追加
func RetryWithSuccessCount(attempts int, delay time.Duration, fn func() error, callback func(error)) (int, error) {
	var err error
	successCount := 0
	for i := 0; i < attempts; i++ {
		err = fn()
		if err == nil {
			successCount++
			return successCount, nil
		}
		callback(err)
		time.Sleep(delay)
	}
	return successCount, err
}
