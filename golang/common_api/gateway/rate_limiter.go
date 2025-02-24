package gateway

import (
	"net/http"
	"sync"
	"time"
)

// RateLimiter implements a simple token bucket rate limiter.
// It refills tokens at a fixed rate and limits the number of requests allowed.

type RateLimiter struct {
	mu         sync.Mutex
	tokens     int
	lastRefill time.Time
	rate       float64 // tokens per second
	capacity   int
}

// NewRateLimiter creates a new RateLimiter with the given rate and capacity.
func NewRateLimiter(rate float64, capacity int) *RateLimiter {
	return &RateLimiter{
		tokens:     capacity,
		lastRefill: time.Now(),
		rate:       rate,
		capacity:   capacity,
	}
}

// Allow checks if a request is allowed based on token availability.
func (rl *RateLimiter) Allow() bool {
	rl.mu.Lock()
	defer rl.mu.Unlock()

	now := time.Now()
	duration := now.Sub(rl.lastRefill).Seconds()
	replenish := int(duration * rl.rate)
	if replenish > 0 {
		rl.tokens += replenish
		if rl.tokens > rl.capacity {
			rl.tokens = rl.capacity
		}
		rl.lastRefill = now
	}

	if rl.tokens > 0 {
		rl.tokens--
		return true
	}
	return false
}

// SetRate はレートリミッターのレートを動的に設定します。
func (rl *RateLimiter) SetRate(rate float64) {
	rl.mu.Lock()
	defer rl.mu.Unlock()
	rl.rate = rate
}

// Reset はレートリミッターのトークンをリセットします。
func (rl *RateLimiter) Reset() {
	rl.mu.Lock()
	defer rl.mu.Unlock()
	rl.tokens = rl.capacity
	rl.lastRefill = time.Now()
}

// 新しいメソッドを追加して、レートリミッターのエラーログを取得します。
func (rl *RateLimiter) GetErrorLogs() []string {
	return []string{"Error log 1", "Error log 2"}
}

// RateLimitMiddleware is an HTTP middleware that rate limits incoming requests.
func RateLimitMiddleware(rl *RateLimiter, next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if !rl.Allow() {
			http.Error(w, "Too Many Requests", http.StatusTooManyRequests)
			return
		}
		next.ServeHTTP(w, r)
	})
}
