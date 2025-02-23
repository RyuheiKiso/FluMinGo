package common

import (
	"log"
	"sync"
)

// NotificationManager は通知を管理する構造体です。
type NotificationManager struct {
	subscribers map[string]chan string
	mutex       sync.RWMutex
}

// NewNotificationManager は新しい NotificationManager インスタンスを作成します。
func NewNotificationManager() *NotificationManager {
	return &NotificationManager{
		subscribers: make(map[string]chan string),
	}
}

// Subscribe は新しいサブスクライバーを追加します。
func (nm *NotificationManager) Subscribe(id string) <-chan string {
	nm.mutex.Lock()
	defer nm.mutex.Unlock()
	ch := make(chan string)
	nm.subscribers[id] = ch
	return ch
}

// Unsubscribe はサブスクライバーを削除します。
func (nm *NotificationManager) Unsubscribe(id string) {
	nm.mutex.Lock()
	defer nm.mutex.Unlock()
	if ch, exists := nm.subscribers[id]; exists {
		close(ch)
		delete(nm.subscribers, id)
	}
}

// Notify は全てのサブスクライバーに通知を送信します。
func (nm *NotificationManager) Notify(message string) {
	nm.mutex.RLock()
	defer nm.mutex.RUnlock()
	for id, ch := range nm.subscribers {
		select {
		case ch <- message:
		default:
			log.Printf("サブスクライバー %s への通知に失敗しました", id)
		}
	}
}
