package common

import (
	"sync"
	"time"
)

// CacheManager はキャッシュ管理を行う構造体です。
type CacheManager struct {
	cache      map[string]interface{}
	mutex      sync.RWMutex
	expiration time.Duration
}

// NewCacheManager は新しい CacheManager インスタンスを作成します。
func NewCacheManager(expiration time.Duration) *CacheManager {
	return &CacheManager{
		cache:      make(map[string]interface{}),
		expiration: expiration,
	}
}

// Set はキャッシュに値を設定します。
func (cm *CacheManager) Set(key string, value interface{}) {
	cm.mutex.Lock()
	defer cm.mutex.Unlock()
	cm.cache[key] = value
	go cm.expireKey(key)
}

// Get はキャッシュから値を取得します。
func (cm *CacheManager) Get(key string) (interface{}, bool) {
	cm.mutex.RLock()
	defer cm.mutex.RUnlock()
	value, exists := cm.cache[key]
	return value, exists
}

// expireKey は指定されたキーを一定時間後にキャッシュから削除します。
func (cm *CacheManager) expireKey(key string) {
	time.Sleep(cm.expiration)
	cm.mutex.Lock()
	defer cm.mutex.Unlock()
	delete(cm.cache, key)
}

// キャッシュのクリア機能を追加
func (cm *CacheManager) ClearCache() {
	cm.mutex.Lock()
	defer cm.mutex.Unlock()
	cm.cache = make(map[string]interface{})
}
