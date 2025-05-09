package db

import (
	"fmt"
	"strings"
	"sync"
	"time"
)

// CacheEntry はキャッシュのエントリを表します。
type CacheEntry struct {
	Result    string
	Timestamp time.Time
}

// Cache はクエリ結果をキャッシュするための構造体です。
type Cache struct {
	Data  map[string]CacheEntry
	Mutex sync.RWMutex
	TTL   time.Duration // キャッシュの有効期限を追加
}

// キャッシュのサイズ制限機能を追加
func (c *Cache) SetMaxSize(maxSize int) {
	c.Mutex.Lock()
	defer c.Mutex.Unlock()
	if len(c.Data) > maxSize {
		for k := range c.Data {
			delete(c.Data, k)
			if len(c.Data) <= maxSize {
				break
			}
		}
	}
}

// キャッシュのエントリ数を取得する機能を追加
func (c *Cache) GetEntryCount() int {
	c.Mutex.RLock()
	defer c.Mutex.RUnlock()
	return len(c.Data)
}

// キャッシュのヒット率を計測する機能を追加
func (c *Cache) GetHitRate(totalQueries int) float64 {
	c.Mutex.RLock()
	defer c.Mutex.RUnlock()
	if totalQueries == 0 {
		return 0.0
	}
	return float64(len(c.Data)) / float64(totalQueries)
}

// キャッシュのエントリの有効期限を確認する機能を追加
func (c *Cache) IsEntryExpired(key string) bool {
	c.Mutex.RLock()
	defer c.Mutex.RUnlock()
	entry, found := c.Data[key]
	if !found {
		return true
	}
	return time.Since(entry.Timestamp) > c.TTL
}

// キャッシュのエントリを手動で削除する機能を追加
func (c *Cache) DeleteEntry(key string) {
	c.Mutex.Lock()
	defer c.Mutex.Unlock()
	delete(c.Data, key)
}

// キャッシュのエントリの有効期限を一括で更新する機能を追加
func (c *Cache) UpdateTTL(newTTL time.Duration) {
	c.Mutex.Lock()
	defer c.Mutex.Unlock()
	c.TTL = newTTL
	for k, v := range c.Data {
		v.Timestamp = time.Now()
		c.Data[k] = v
	}
}

// キャッシュのエントリをすべて取得する機能を追加
func (c *Cache) GetAllEntries() map[string]CacheEntry {
	c.Mutex.RLock()
	defer c.Mutex.RUnlock()
	return c.Data
}

// キャッシュのエントリを更新する機能を追加
func (c *Cache) UpdateEntry(key string, value CacheEntry) {
	c.Mutex.Lock()
	defer c.Mutex.Unlock()
	c.Data[key] = value
}

// DBQueries provides common database query management functions.
// データベースクエリの実装
type DBQueries struct {
	Cache Cache
}

// NewDBQueries creates a new DBQueries instance.
func NewDBQueries(ttl time.Duration) *DBQueries {
	return &DBQueries{
		Cache: Cache{Data: make(map[string]CacheEntry), TTL: ttl},
	}
}

// SelectQuery constructs a SELECT SQL query for the given table and columns.
func (q *DBQueries) SelectQuery(table string, columns []string) string {
	cols := "*"
	if len(columns) > 0 {
		cols = strings.Join(columns, ", ")
	}
	query := fmt.Sprintf("SELECT %s FROM %s", cols, table)

	// キャッシュから結果を取得
	q.Cache.Mutex.RLock()
	if entry, found := q.Cache.Data[query]; found && time.Since(entry.Timestamp) < q.Cache.TTL {
		q.Cache.Mutex.RUnlock()
		return entry.Result
	}
	q.Cache.Mutex.RUnlock()

	// キャッシュに結果を保存
	q.Cache.Mutex.Lock()
	q.Cache.Data[query] = CacheEntry{Result: query, Timestamp: time.Now()}
	q.Cache.Mutex.Unlock()

	return query
}

// ClearCache はキャッシュをクリアします。
func (q *DBQueries) ClearCache() {
	q.Cache.Mutex.Lock()
	defer q.Cache.Mutex.Unlock()
	q.Cache.Data = make(map[string]CacheEntry)
}

// キャッシュの自動クリア機能を追加
func (q *DBQueries) AutoClearCache(interval time.Duration) {
	ticker := time.NewTicker(interval)
	go func() {
		for range ticker.C {
			q.ClearCache()
		}
	}()
}

// キャッシュのエントリをすべて取得する機能を追加
func (q *DBQueries) GetAllCacheEntries() map[string]CacheEntry {
	return q.Cache.GetAllEntries()
}
