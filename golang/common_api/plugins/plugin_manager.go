package plugins

import (
	"errors"
	"sync"
)

// 動的プラグイン管理システム

type PluginManager struct {
	plugins map[string]interface{}
	mutex   sync.Mutex
}

func NewPluginManager() *PluginManager {
	return &PluginManager{plugins: make(map[string]interface{})}
}

func (p *PluginManager) Load(name string, plugin interface{}) {
	p.mutex.Lock()
	defer p.mutex.Unlock()

	p.plugins[name] = plugin
}

func (p *PluginManager) Get(name string) (interface{}, error) {
	p.mutex.Lock()
	defer p.mutex.Unlock()

	plugin, exists := p.plugins[name]
	if !exists {
		return nil, errors.New("plugin not found")
	}

	return plugin, nil
}
