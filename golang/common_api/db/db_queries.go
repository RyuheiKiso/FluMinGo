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

// DBQueries provides common database query management functions.
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
