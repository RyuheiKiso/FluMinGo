package notification

import (
	"log"
	"time"
)

// NotificationManager は通知管理を行う構造体です。
type NotificationManager struct {
	// ...必要なフィールド...
	scheduledNotifications map[string]time.Time
}

// NewNotificationManager は新しい NotificationManager インスタンスを作成します。
func NewNotificationManager() *NotificationManager {
	return &NotificationManager{
		scheduledNotifications: make(map[string]time.Time),
		// ...フィールドの初期化...
	}
}

// SendNotification は通知を送信します。
func (nm *NotificationManager) SendNotification(message string) {
	// ...通知送信の実装...
	log.Println("通知: " + message)
}

// ScheduleNotification は通知をスケジュールします。
func (nm *NotificationManager) ScheduleNotification(message string, t time.Time) {
	nm.scheduledNotifications[message] = t
	log.Printf("通知スケジュール: %s at %s\n", message, t.Format(time.RFC3339))
}

// CancelNotification はスケジュールされた通知をキャンセルします。
func (nm *NotificationManager) CancelNotification(message string) {
	delete(nm.scheduledNotifications, message)
	log.Printf("通知キャンセル: %s\n", message)
}

// UpdateNotification は既存の通知を更新します。
func (nm *NotificationManager) UpdateNotification(oldMessage string, newMessage string) {
	if t, exists := nm.scheduledNotifications[oldMessage]; exists {
		delete(nm.scheduledNotifications, oldMessage)
		nm.scheduledNotifications[newMessage] = t
		log.Printf("通知更新: %s to %s\n", oldMessage, newMessage)
	} else {
		log.Printf("通知更新失敗: %s は存在しません\n", oldMessage)
	}
}

// ListScheduledNotifications はスケジュールされた通知のリストを返します。
func (nm *NotificationManager) ListScheduledNotifications() map[string]time.Time {
	return nm.scheduledNotifications
}
