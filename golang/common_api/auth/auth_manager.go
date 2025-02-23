package auth

import (
	"errors"
	"sync"
)

// AuthManager は認証管理を行う構造体です。
type AuthManager struct {
	users map[string]string
	mutex sync.RWMutex
}

// NewAuthManager は新しい AuthManager インスタンスを作成します。
func NewAuthManager() *AuthManager {
	return &AuthManager{
		users: make(map[string]string),
	}
}

// Register は新しいユーザーを登録します。
func (am *AuthManager) Register(username, password string) error {
	am.mutex.Lock()
	defer am.mutex.Unlock()
	if _, exists := am.users[username]; exists {
		return errors.New("ユーザー名が既に存在します")
	}
	am.users[username] = password
	return nil
}

// Authenticate はユーザーの認証を行います。
func (am *AuthManager) Authenticate(username, password string) bool {
	am.mutex.RLock()
	defer am.mutex.RUnlock()
	storedPassword, exists := am.users[username]
	if !exists {
		return false
	}
	return storedPassword == password
}

// ユーザーのパスワードをリセットするメソッドを追加
func (am *AuthManager) ResetPassword(username, newPassword string) error {
	am.mutex.Lock()
	defer am.mutex.Unlock()
	if _, exists := am.users[username]; !exists {
		return errors.New("ユーザーが存在しません")
	}
	am.users[username] = newPassword
	return nil
}
