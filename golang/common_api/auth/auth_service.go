// Package auth provides the implementation of the authentication service.
package auth

import (
	"fmt"
	"log"
	"time"
)

// AuthService implements the authentication logic using a repository.
type AuthService struct {
	repo        AuthRepository
	tokenExpiry time.Duration
}

// NewAuthService creates a new AuthService.
func NewAuthService(repo AuthRepository, tokenExpiry time.Duration) *AuthService {
	return &AuthService{repo: repo, tokenExpiry: tokenExpiry}
}

// Authenticate implements the Authenticator interface.
func (s *AuthService) Authenticate(username, password string) (bool, error) {
	// For demonstration, delegate to repository validation
	ok, err := s.repo.ValidateCredentials(username, password)
	if err != nil || !ok {
		log.Printf("認証に失敗しました: %v", err)
		return false, err
	}
	log.Println("認証に成功しました")
	return true, nil
}

// SaveToken はトークンを保存するメソッドです。
func (s *AuthService) SaveToken(username, token string) error {
	return s.repo.SaveToken(username, token)
}

// DeleteToken はトークンを削除するメソッドです。
func (s *AuthService) DeleteToken(token string) error {
	return s.repo.DeleteToken(token)
}

// Login はユーザー名とパスワードを使用してログインし、トークンを返します。
func (s *AuthService) Login(username, password string) (string, error) {
	ok, err := s.Authenticate(username, password)
	if err != nil || !ok {
		return "", err
	}
	token := "dummy-token" // 実際のトークン生成ロジックをここに追加
	err = s.SaveToken(username, token)
	if err != nil {
		return "", err
	}
	// トークンの有効期限を設定
	time.AfterFunc(s.tokenExpiry, func() {
		s.DeleteToken(token)
	})
	return token, nil
}

// Logout はトークンを使用してログアウトします。
func (s *AuthService) Logout(token string) error {
	return s.DeleteToken(token)
}

// ChangePassword はユーザーのパスワードを変更するメソッドです。
func (s *AuthService) ChangePassword(username, oldPassword, newPassword string) error {
	ok, err := s.Authenticate(username, oldPassword)
	if err != nil || !ok {
		return fmt.Errorf("現在のパスワードが正しくありません")
	}
	// 実際のパスワード変更ロジックをここに追加
	log.Println("パスワードが正常に変更されました")
	return nil
}
