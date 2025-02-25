package cache

import (
	"FluMinGo/golang/common_api/common"
	"encoding/json"
	"fmt"
	"os"
	"sync"
	"sync/atomic"
	"time"
)

// キャッシュサービスの実装
// キャッシュサービス構造体
// sync.Map を利用して並行性に対応

// CacheService represents a cache service with thread-safe operations.
type CacheService struct {
	data         sync.Map
	hitCount     int64
	missCount    int64
	logger       common.Logger
	errorHandler common.ErrorHandler
}

// NewCacheService initializes a new CacheService instance.
func NewCacheService(logger common.Logger, errorHandler common.ErrorHandler) *CacheService {
	return &CacheService{
		logger:       logger,
		errorHandler: errorHandler,
	}
}

// Set stores a value in the cache.
func (c *CacheService) Set(key string, value interface{}) {
	c.data.Store(key, value)
	c.logger.Info("Cache set: " + key)
}

// Get retrieves a value from the cache.
func (c *CacheService) Get(key string) (interface{}, bool) {
	value, ok := c.data.Load(key)
	if ok {
		atomic.AddInt64(&c.hitCount, 1)
		c.logger.Info("Cache hit: " + key)
	} else {
		atomic.AddInt64(&c.missCount, 1)
		errMsg := c.errorHandler.HandleError(fmt.Errorf("cache miss: %s", key))
		c.logger.Error(errMsg)
	}
	return value, ok
}

// Delete removes a key from the cache.
func (c *CacheService) Delete(key string) {
	c.data.Delete(key)
	c.logger.Info("Cache delete: " + key)
}

// Clear removes all entries from the cache.
func (c *CacheService) Clear() {
	c.data.Range(func(key, value interface{}) bool {
		c.data.Delete(key)
		return true
	})
	c.logger.Info("Cache cleared")
}

// SetWithExpiration stores a value in the cache with an expiration duration.
func (c *CacheService) SetWithExpiration(key string, value interface{}, duration time.Duration) {
	c.Set(key, value)
	go func() {
		time.Sleep(duration)
		c.Delete(key)
	}()
}

// RefreshWithExpiration periodically updates a cache entry with a new value.
func (c *CacheService) RefreshWithExpiration(key string, valueFunc func() (interface{}, error), duration time.Duration) {
	go func() {
		for {
			value, err := valueFunc()
			if err != nil {
				c.logger.Error(c.errorHandler.HandleError(err))
				return
			}
			c.Set(key, value)
			time.Sleep(duration)
		}
	}()
}

// GetHitRate returns the cache hit rate.
func (c *CacheService) GetHitRate() float64 {
	total := atomic.LoadInt64(&c.hitCount) + atomic.LoadInt64(&c.missCount)
	if total == 0 {
		return 0
	}
	return float64(atomic.LoadInt64(&c.hitCount)) / float64(total)
}

// Size returns the number of items in the cache.
func (c *CacheService) Size() int {
	size := 0
	c.data.Range(func(key, value interface{}) bool {
		size++
		return true
	})
	return size
}

// GetKeys returns all keys in the cache.
func (c *CacheService) GetKeys() []string {
	keys := []string{}
	c.data.Range(func(key, value interface{}) bool {
		keys = append(keys, key.(string))
		return true
	})
	return keys
}

// GetStatistics returns cache statistics.
func (c *CacheService) GetStatistics() map[string]interface{} {
	stats := make(map[string]interface{})
	stats["hitCount"] = atomic.LoadInt64(&c.hitCount)
	stats["missCount"] = atomic.LoadInt64(&c.missCount)
	stats["hitRate"] = c.GetHitRate()
	stats["size"] = c.Size()
	return stats
}

// ExportStatistics exports cache statistics to a file.
func (c *CacheService) ExportStatistics(filePath string) error {
	stats := c.GetStatistics()
	file, err := os.Create(filePath)
	if err != nil {
		c.logger.Error(c.errorHandler.HandleError(err))
		return err
	}
	defer file.Close()
	encoder := json.NewEncoder(file)
	if err := encoder.Encode(stats); err != nil {
		c.logger.Error(c.errorHandler.HandleError(err))
		return err
	}
	c.logger.Info("Cache statistics exported: " + filePath)
	return nil
}

// ResetStatistics resets cache statistics.
func (c *CacheService) ResetStatistics() {
	atomic.StoreInt64(&c.hitCount, 0)
	atomic.StoreInt64(&c.missCount, 0)
	c.logger.Info("Cache statistics reset")
}
