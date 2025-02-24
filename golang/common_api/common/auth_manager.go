package common

import (
	"errors"
	"sync"
)

// AuthManager は認証・認可を管理する構造体です。
type AuthManager struct {
	users map[string]string // ユーザー名とパスワードのマップ
	mutex sync.RWMutex
}

// NewAuthManager は新しい AuthManager インスタンスを作成します。
func NewAuthManager() *AuthManager {
	return &AuthManager{
		users: make(map[string]string),
	}
}

// RegisterUser は新しいユーザーを登録します。
func (am *AuthManager) RegisterUser(username, password string) error {
	am.mutex.Lock()
	defer am.mutex.Unlock()
	if _, exists := am.users[username]; exists {
		return errors.New("ユーザーは既に存在します")
	}
	am.users[username] = password
	return nil
}

// Authenticate はユーザーの認証を行います。
func (am *AuthManager) Authenticate(username, password string) bool {
	am.mutex.RLock()
	defer am.mutex.RUnlock()
	storedPassword, exists := am.users[username]
	if !exists || storedPassword != password {
		return false
	}
	return true
}

// Authorize はユーザーの認可を行います。
func (am *AuthManager) Authorize(username, resource string) bool {
	// 簡単な例として、全てのユーザーに全てのリソースへのアクセスを許可します。
	return true
}

// ユーザーの削除機能を追加
func (am *AuthManager) DeleteUser(username string) error {
	am.mutex.Lock()
	defer am.mutex.Unlock()
	if _, exists := am.users[username]; !exists {
		return errors.New("ユーザーが存在しません")
	}
	delete(am.users, username)
	return nil
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
