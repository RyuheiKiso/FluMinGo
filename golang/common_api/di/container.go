package di

import (
	"sync"
)

// DIコンテナの初期化と依存関係登録

type Container struct {
	services map[string]interface{}
	mutex    sync.Mutex
}

func NewContainer() *Container {
	return &Container{services: make(map[string]interface{})}
}

func (c *Container) Register(name string, service interface{}) {
	c.mutex.Lock()
	defer c.mutex.Unlock()

	c.services[name] = service
}

func (c *Container) Resolve(name string) interface{} {
	c.mutex.Lock()
	defer c.mutex.Unlock()

	return c.services[name]
}

// サービスの削除機能を追加
func (c *Container) Unregister(name string) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	delete(c.services, name)
}
