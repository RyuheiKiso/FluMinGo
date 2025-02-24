// Package auth provides the implementation of the authentication service.
package auth

import (
	"FluMinGo/golang/common_api/common"
	"fmt"
	"time"
)

// AuthService implements the authentication logic using a repository.
type AuthService struct {
	repo         AuthRepository
	tokenExpiry  time.Duration
	logger       common.Logger
	errorHandler common.ErrorHandler
}

// GetTokensByUsername implements Authenticator.
func (s *AuthService) GetTokensByUsername(username string) ([]string, error) {
	panic("unimplemented")
}

// NewAuthService creates a new AuthService.
func NewAuthService(repo AuthRepository, tokenExpiry time.Duration, logger common.Logger, errorHandler common.ErrorHandler) *AuthService {
	return &AuthService{repo: repo, tokenExpiry: tokenExpiry, logger: logger, errorHandler: errorHandler}
}

// Authenticate implements the Authenticator interface.
func (s *AuthService) Authenticate(username, password string) (bool, error) {
	// For demonstration, delegate to repository validation
	ok, err := s.repo.ValidateCredentials(username, password)
	if err != nil || !ok {
		errMsg := s.errorHandler.HandleError(err)
		s.logger.Error(errMsg)
		return false, err
	}
	s.logger.Info("認証に成功しました")
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
	s.logger.Info("パスワードが正常に変更されました")
	return nil
}

// ResetPassword はユーザーのパスワードをリセットするメソッドです。
func (s *AuthService) ResetPassword(username, newPassword string) error {
	// 実際のパスワードリセットロジックをここに追加
	s.logger.Info("パスワードが正常にリセットされました: " + username)
	return nil
}

// ユーザーのトークンをすべて削除するメソッドを追加
func (s *AuthService) DeleteAllTokens(username string) error {
	tokens, err := s.repo.GetTokensByUsername(username)
	if err != nil {
		s.logger.Error(s.errorHandler.HandleError(err))
		return err
	}
	for _, token := range tokens {
		err := s.DeleteToken(token)
		if err != nil {
			s.logger.Error(s.errorHandler.HandleError(err))
			return err
		}
	}
	s.logger.Info("ユーザーのすべてのトークンを削除しました: " + username)
	return nil
}

// RefreshToken はトークンをリフレッシュするメソッドです。
func (s *AuthService) RefreshToken(token string) (string, error) {
	username, err := s.repo.GetUsernameByToken(token)
	if err != nil {
		s.logger.Error(s.errorHandler.HandleError(err))
		return "", err
	}
	newToken := "new-dummy-token" // 実際のトークン生成ロジックをここに追加
	err = s.SaveToken(username, newToken)
	if err != nil {
		s.logger.Error(s.errorHandler.HandleError(err))
		return "", err
	}
	s.logger.Info("トークンがリフレッシュされました: " + username)
	return newToken, nil
}
