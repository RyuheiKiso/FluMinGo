package advanced_rate_limiting

import (
	"context"
	"log"
	"sync"
	"time"
)

// 動的なレート調整・スロットリング実装

type RateLimiter struct {
	requests     map[string]int
	mutex        sync.Mutex
	limit        int
	interval     time.Duration
	adjustmentFn func() int
}

func NewRateLimiter(limit int, interval time.Duration, adjustmentFn func() int) *RateLimiter {
	return &RateLimiter{
		requests:     make(map[string]int),
		limit:        limit,
		interval:     interval,
		adjustmentFn: adjustmentFn,
	}
}

func (r *RateLimiter) Allow(ctx context.Context, key string) bool {
	r.mutex.Lock()
	defer r.mutex.Unlock()

	if r.requests[key] >= r.limit {
		log.Printf("Rate limit exceeded for key: %s", key)
		return false
	}

	r.requests[key]++
	time.AfterFunc(r.interval, func() {
		r.mutex.Lock()
		defer r.mutex.Unlock()
		r.requests[key]--
	})

	log.Printf("Request allowed for key: %s", key)
	return true
}

func (r *RateLimiter) AdjustLimit() {
	r.mutex.Lock()
	defer r.mutex.Unlock()

	newLimit := r.adjustmentFn()
	log.Printf("Adjusting rate limit from %d to %d", r.limit, newLimit)
	r.limit = newLimit
}

// レートリミッターの現在のリクエスト数を取得するメソッドを追加
func (r *RateLimiter) GetCurrentRequests(key string) int {
	r.mutex.Lock()
	defer r.mutex.Unlock()
	return r.requests[key]
}
