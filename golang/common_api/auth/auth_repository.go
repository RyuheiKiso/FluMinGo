// Package auth provides repository implementations for authentication.
package auth

import "errors"

// AuthRepository defines the contract for credential validation.
type AuthRepository interface {
	ValidateCredentials(username, password string) (bool, error)
	SaveToken(username, token string) error
	DeleteToken(token string) error
	GetTokensByUsername(username string) ([]string, error) // 追加
	GetUsernameByToken(token string) (string, error)       // 追加
}

// DummyAuthRepository is a simple implementation of AuthRepository.
type DummyAuthRepository struct{}

// NewDummyAuthRepository creates a new instance of DummyAuthRepository.
func NewDummyAuthRepository() AuthRepository {
	return &DummyAuthRepository{}
}

// ValidateCredentials checks if the provided credentials are valid.
func (r *DummyAuthRepository) ValidateCredentials(username, password string) (bool, error) {
	// For demonstration, consider credentials valid if username equals password.
	if username == password {
		return true, nil
	}
	return false, nil
}

// SaveToken はトークンを保存するメソッドです。
func (r *DummyAuthRepository) SaveToken(username, token string) error {
	// 実装を追加
	return nil
}

// DeleteToken はトークンを削除するメソッドです。
func (r *DummyAuthRepository) DeleteToken(token string) error {
	// 実装を追加
	return nil
}

// GetTokensByUsername はユーザー名からすべてのトークンを取得するメソッドです。
func (r *DummyAuthRepository) GetTokensByUsername(username string) ([]string, error) {
	// 実装を追加
	return nil, nil
}

// GetUsernameByToken はトークンからユーザー名を取得するメソッドです。
func (r *DummyAuthRepository) GetUsernameByToken(token string) (string, error) {
	// 実装を追加
	return "dummy-username", nil
}

// ResetPassword はユーザーのパスワードをリセットするメソッドです。
func (r *DummyAuthRepository) ResetPassword(username, newPassword string) error {
	// 実装を追加
	return nil
}

// InMemoryAuthRepository is a simple in-memory implementation of AuthRepository.
type InMemoryAuthRepository struct {
	tokens map[string]string // key: token, value: username
}

// NewInMemoryAuthRepository creates a new instance of InMemoryAuthRepository.
func NewInMemoryAuthRepository() *InMemoryAuthRepository {
	return &InMemoryAuthRepository{
		tokens: make(map[string]string),
	}
}

// SaveToken stores the token for the given username.
func (repo *InMemoryAuthRepository) SaveToken(username, token string) error {
	repo.tokens[token] = username
	return nil
}

// DeleteToken removes the token if it exists, otherwise returns an error.
func (repo *InMemoryAuthRepository) DeleteToken(token string) error {
	if _, exists := repo.tokens[token]; !exists {
		return errors.New("token not found")
	}
	delete(repo.tokens, token)
	return nil
}

// ユーザー名からすべてのトークンを取得するメソッドを追加
func (repo *InMemoryAuthRepository) GetTokensByUsername(username string) ([]string, error) {
	tokens := []string{}
	for token, user := range repo.tokens {
		if user == username {
			tokens = append(tokens, token)
		}
	}
	return tokens, nil
}

// GetUsernameByToken はトークンからユーザー名を取得するメソッドです。
func (repo *InMemoryAuthRepository) GetUsernameByToken(token string) (string, error) {
	username, exists := repo.tokens[token]
	if !exists {
		return "", errors.New("token not found")
	}
	return username, nil
}
