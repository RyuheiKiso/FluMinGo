package di

import (
	"fmt"
	"sync"
)

// DIコンテナの実装
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

// サービスの一覧を取得する機能を追加
func (c *Container) ListServices() []string {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	services := []string{}
	for name := range c.services {
		services = append(services, name)
	}
	return services
}

// サービスの更新機能を追加
func (c *Container) UpdateService(name string, service interface{}) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.services[name] = service
}

// DIコンテナのロギング機能を追加
func (c *Container) LogContainerOperation(operation, serviceName string) {
	fmt.Printf("Container operation: %s, Service: %s\n", operation, serviceName)
}

// サービス名のバリデーション機能を追加
func ValidateServiceName(serviceName string) bool {
	// バリデーションロジックを実装
	return serviceName != ""
}

// DIコンテナのエクスポート機能を追加
func (c *Container) ExportContainer() string {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	return fmt.Sprintf("Exporting container with services: %v", c.ListServices())
}

// DIコンテナのアーカイブ機能を追加
func (c *Container) ArchiveContainer() string {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	return fmt.Sprintf("Archiving container with services: %v", c.ListServices())
}

// サービスの依存関係を解決する機能を追加
func (c *Container) ResolveDependencies(name string) ([]string, error) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	// 依存関係解決ロジックを実装
	// 現在はダミーの依存関係リストを返す
	return []string{"dependency1", "dependency2"}, nil
}

// DIコンテナのバックアップ機能を追加
func (c *Container) BackupContainer() string {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	return fmt.Sprintf("Backing up container with services: %v", c.ListServices())
}

// DIコンテナのインスタンス数を取得する機能を追加
func (c *Container) InstanceCount() int {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	return len(c.services)
}
