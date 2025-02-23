package distributed_cache

import (
	"context"
	"fmt"
	"time"

	"github.com/go-redis/redis/v8"
)

var ctx = context.Background()

// メモリキャッシュとRedis/Memcachedを利用した分散キャッシュ戦略
func InitRedisCache() *redis.Client {
	rdb := redis.NewClient(&redis.Options{
		Addr:     "localhost:6379",
		Password: "",
		DB:       0,
	})

	return rdb
}

func SetCache(rdb *redis.Client, key string, value interface{}) error {
	return rdb.Set(ctx, key, value, 0).Err()
}

func GetCache(rdb *redis.Client, key string) (string, error) {
	return rdb.Get(ctx, key).Result()
}

// キャッシュの削除機能を追加
func DeleteCache(rdb *redis.Client, key string) error {
	return rdb.Del(ctx, key).Err()
}

// キャッシュの有効期限設定機能を追加
func SetCacheWithTTL(rdb *redis.Client, key string, value interface{}, ttl time.Duration) error {
	return rdb.Set(ctx, key, value, ttl).Err()
}

// キャッシュの更新機能を追加
func UpdateCache(rdb *redis.Client, key string, value interface{}) error {
	exists, err := rdb.Exists(ctx, key).Result()
	if err != nil {
		return err
	}
	if exists == 1 {
		return rdb.Set(ctx, key, value, 0).Err()
	}
	return fmt.Errorf("key %s does not exist", key)
}

// キャッシュのロギング機能を追加
func LogCacheOperation(operation, key string) {
	fmt.Printf("Cache operation: %s, Key: %s\n", operation, key)
}

// キャッシュのバリデーション機能を追加
func ValidateCacheKey(key string) bool {
	// バリデーションロジックを実装
	return key != ""
}

// キャッシュのエクスポート機能を追加
func ExportCache(rdb *redis.Client, key string) (string, error) {
	return rdb.Get(ctx, key).Result()
}

// キャッシュのアーカイブ機能を追加
func ArchiveCache(rdb *redis.Client, key string) (string, error) {
	value, err := rdb.Get(ctx, key).Result()
	if err != nil {
		return "", err
	}
	fmt.Printf("Archiving cache: %s\n", key)
	// アーカイブ処理の実装
	return value, nil
}
