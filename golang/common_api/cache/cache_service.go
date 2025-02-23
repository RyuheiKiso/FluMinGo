package cache

import (
	"sync"
	"time"
)

// キャッシュサービス構造体
// sync.Map を利用して並行性に対応

type CacheService struct {
	data      sync.Map
	hitCount  int
	missCount int
}

// NewCacheService キャッシュサービスを初期化する関数
func NewCacheService() *CacheService {
	return &CacheService{}
}

// Set キャッシュに値を設定するメソッド
func (c *CacheService) Set(key string, value interface{}) {
	c.data.Store(key, value)
}

// Get キャッシュからキーに対応する値を取得するメソッド
func (c *CacheService) Get(key string) (interface{}, bool) {
	value, ok := c.data.Load(key)
	if ok {
		c.hitCount++
	} else {
		c.missCount++
	}
	return value, ok
}

// Delete キャッシュからキーを削除するメソッド
func (c *CacheService) Delete(key string) {
	c.data.Delete(key)
}

// Clear 全てのキャッシュをクリアするメソッド
func (c *CacheService) Clear() {
	c.data.Range(func(key, value interface{}) bool {
		c.data.Delete(key)
		return true
	})
}

// SetWithExpiration キャッシュに期限付きで値を設定するメソッド
func (c *CacheService) SetWithExpiration(key string, value interface{}, duration time.Duration) {
	c.Set(key, value)
	go func() {
		time.Sleep(duration)
		c.Delete(key)
	}()
}

// GetHitRate キャッシュヒット率を取得するメソッド
func (c *CacheService) GetHitRate() float64 {
	total := c.hitCount + c.missCount
	if total == 0 {
		return 0
	}
	return float64(c.hitCount) / float64(total)
}

// Size はキャッシュのサイズを取得するメソッドです。
func (c *CacheService) Size() int {
	size := 0
	c.data.Range(func(key, value interface{}) bool {
		size++
		return true
	})
	return size
}

// GetKeys はキャッシュ内の全てのキーを取得するメソッドです。
func (c *CacheService) GetKeys() []string {
	keys := []string{}
	c.data.Range(func(key, value interface{}) bool {
		keys = append(keys, key.(string))
		return true
	})
	return keys
}

// GetStatistics はキャッシュの統計情報を取得するメソッドです。
func (c *CacheService) GetStatistics() map[string]interface{} {
	stats := make(map[string]interface{})
	stats["hitCount"] = c.hitCount
	stats["missCount"] = c.missCount
	stats["hitRate"] = c.GetHitRate()
	stats["size"] = c.Size()
	return stats
}
