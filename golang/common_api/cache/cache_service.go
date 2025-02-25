package cache

import (
	"FluMinGo/golang/common_api/common"
	"encoding/json"
	"fmt"
	"os"
	"sync"
	"time"
)

// キャッシュサービスの実装
// キャッシュサービス構造体
// sync.Map を利用して並行性に対応

type CacheService struct {
	data         sync.Map
	hitCount     int
	missCount    int
	logger       common.Logger
	errorHandler common.ErrorHandler
}

// NewCacheService キャッシュサービスを初期化する関数
func NewCacheService(logger common.Logger, errorHandler common.ErrorHandler) *CacheService {
	return &CacheService{
		logger:       logger,
		errorHandler: errorHandler,
	}
}

// Set キャッシュに値を設定するメソッド
func (c *CacheService) Set(key string, value interface{}) {
	c.data.Store(key, value)
	c.logger.Info("キャッシュに値を設定しました: " + key)
}

// Get キャッシュからキーに対応する値を取得するメソッド
func (c *CacheService) Get(key string) (interface{}, bool) {
	value, ok := c.data.Load(key)
	if ok {
		c.hitCount++
		c.logger.Info("キャッシュヒット: " + key)
	} else {
		c.missCount++
		errMsg := c.errorHandler.HandleError(fmt.Errorf("キャッシュミス: %s", key))
		c.logger.Error(errMsg)
	}
	return value, ok
}

// Delete キャッシュからキーを削除するメソッド
func (c *CacheService) Delete(key string) {
	c.data.Delete(key)
	c.logger.Info("キャッシュからキーを削除しました: " + key)
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

// RefreshWithExpiration キャッシュの自動更新機能を追加するメソッド
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

// ExportStatistics はキャッシュの統計情報をファイルにエクスポートするメソッドです。
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
	c.logger.Info("キャッシュの統計情報をエクスポートしました: " + filePath)
	return nil
}

// キャッシュの統計情報をリセットするメソッドを追加
func (c *CacheService) ResetStatistics() {
	c.hitCount = 0
	c.missCount = 0
	c.logger.Info("キャッシュの統計情報をリセットしました")
}
