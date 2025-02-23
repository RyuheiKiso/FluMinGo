package cache

import (
	"sync"
)

// CacheManager はキャッシュ管理を行う構造体です。
type CacheManager struct {
	cache map[string]interface{}
	mutex sync.RWMutex
}

// NewCacheManager は新しい CacheManager インスタンスを作成します。
func NewCacheManager() *CacheManager {
	return &CacheManager{
		cache: make(map[string]interface{}),
	}
}

// Set はキャッシュに値を設定します。
func (cm *CacheManager) Set(key string, value interface{}) {
	cm.mutex.Lock()
	defer cm.mutex.Unlock()
	cm.cache[key] = value
}

// Get はキャッシュから値を取得します。
func (cm *CacheManager) Get(key string) (interface{}, bool) {
	cm.mutex.RLock()
	defer cm.mutex.RUnlock()
	value, exists := cm.cache[key]
	return value, exists
}

// Delete はキャッシュから値を削除します。
func (cm *CacheManager) Delete(key string) {
	cm.mutex.Lock()
	defer cm.mutex.Unlock()
	delete(cm.cache, key)
}

// キャッシュのサイズを取得するメソッドを追加
func (cm *CacheManager) Size() int {
	cm.mutex.RLock()
	defer cm.mutex.RUnlock()
	return len(cm.cache)
}
