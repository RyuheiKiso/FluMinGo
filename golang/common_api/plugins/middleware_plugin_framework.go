package plugins

import (
	"net/http"
	"sync"
)

// ミドルウェアプラグインフレームワーク: 動的ロード・更新機能

type MiddlewarePluginFramework struct {
	middlewares []func(http.Handler) http.Handler
	mutex       sync.Mutex
}

func NewMiddlewarePluginFramework() *MiddlewarePluginFramework {
	return &MiddlewarePluginFramework{}
}

func (m *MiddlewarePluginFramework) Use(middleware func(http.Handler) http.Handler) {
	m.mutex.Lock()
	defer m.mutex.Unlock()

	m.middlewares = append(m.middlewares, middleware)
}

func (m *MiddlewarePluginFramework) Apply(next http.Handler) http.Handler {
	for i := len(m.middlewares) - 1; i >= 0; i-- {
		next = m.middlewares[i](next)
	}

	return next
}
