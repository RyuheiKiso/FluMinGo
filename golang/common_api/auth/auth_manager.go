// auth_manager.go ファイル
// このファイルは、認証管理を行う構造体を提供します。

package auth

import (
	"errors"
	"sync"
)

// AuthManager 構造体
// 認証管理を行う構造体です。
type AuthManager struct {
	users map[string]string
	mutex sync.RWMutex
}

// NewAuthManager 関数
// 新しい AuthManager インスタンスを作成します。
func NewAuthManager() *AuthManager {
	return &AuthManager{
		users: make(map[string]string),
	}
}

// Register 関数
// 新しいユーザーを登録します。
func (am *AuthManager) Register(username, password string) error {
	am.mutex.Lock()
	defer am.mutex.Unlock()
	if _, exists := am.users[username]; exists {
		return errors.New("ユーザー名が既に存在します")
	}
	am.users[username] = password
	return nil
}

// Authenticate 関数
// ユーザーの認証を行います。
func (am *AuthManager) Authenticate(username, password string) bool {
	am.mutex.RLock()
	defer am.mutex.RUnlock()
	storedPassword, exists := am.users[username]
	if !exists {
		return false
	}
	return storedPassword == password
}

// ResetPassword 関数
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

// DeleteUser 関数
// ユーザーを削除するメソッドです。
func (am *AuthManager) DeleteUser(username string) error {
	am.mutex.Lock()
	defer am.mutex.Unlock()
	if _, exists := am.users[username]; !exists {
		return errors.New("ユーザーが存在しません")
	}
	delete(am.users, username)
	return nil
}

// GetUsernames 関数
// すべてのユーザー名を取得するメソッドです。
func (am *AuthManager) GetUsernames() []string {
	am.mutex.RLock()
	defer am.mutex.RUnlock()
	usernames := make([]string, 0, len(am.users))
	for username := range am.users {
		usernames = append(usernames, username)
	}
	return usernames
}
