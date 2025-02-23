package distributed_cache

import (
	"context"

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
