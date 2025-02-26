// auth_repository.go ファイル
// このファイルは、認証のためのリポジトリ実装を提供します。

// Package auth provides repository implementations for authentication.
package auth

import "errors"

// AuthRepository インターフェース
// 認証情報の検証の契約を定義します。
type AuthRepository interface {
	ValidateCredentials(username, password string) (bool, error)
	SaveToken(username, token string) error
	DeleteToken(token string) error
	GetTokensByUsername(username string) ([]string, error) // 追加
	GetUsernameByToken(token string) (string, error)       // 追加
}

// DummyAuthRepository 構造体
// AuthRepositoryのシンプルな実装です。
type DummyAuthRepository struct{}

// NewDummyAuthRepository 関数
// 新しいDummyAuthRepositoryインスタンスを作成します。
func NewDummyAuthRepository() AuthRepository {
	return &DummyAuthRepository{}
}

// ValidateCredentials 関数
// 提供された認証情報が有効かどうかを確認します。
func (r *DummyAuthRepository) ValidateCredentials(username, password string) (bool, error) {
	// デモのため、ユーザー名がパスワードと等しい場合に認証情報を有効と見なします。
	if username == password {
		return true, nil
	}
	return false, nil
}

// SaveToken 関数
// トークンを保存するメソッドです。
func (r *DummyAuthRepository) SaveToken(username, token string) error {
	// 実装を追加
	return nil
}

// DeleteToken 関数
// トークンを削除するメソッドです。
func (r *DummyAuthRepository) DeleteToken(token string) error {
	// 実装を追加
	return nil
}

// GetTokensByUsername 関数
// ユーザー名からすべてのトークンを取得するメソッドです。
func (r *DummyAuthRepository) GetTokensByUsername(username string) ([]string, error) {
	// 実装を追加
	return nil, nil
}

// GetUsernameByToken 関数
// トークンからユーザー名を取得するメソッドです。
func (r *DummyAuthRepository) GetUsernameByToken(token string) (string, error) {
	// 実装を追加
	return "dummy-username", nil
}

// ResetPassword 関数
// ユーザーのパスワードをリセットするメソッドです。
func (r *DummyAuthRepository) ResetPassword(username, newPassword string) error {
	// 実装を追加
	return nil
}

// InMemoryAuthRepository 構造体
// AuthRepositoryのシンプルなインメモリ実装です。
type InMemoryAuthRepository struct {
	tokens map[string]string // key: token, value: username
}

// NewInMemoryAuthRepository 関数
// 新しいInMemoryAuthRepositoryインスタンスを作成します。
func NewInMemoryAuthRepository() *InMemoryAuthRepository {
	return &InMemoryAuthRepository{
		tokens: make(map[string]string),
	}
}

// SaveToken 関数
// 指定されたユーザー名のトークンを保存します。
func (repo *InMemoryAuthRepository) SaveToken(username, token string) error {
	repo.tokens[token] = username
	return nil
}

// DeleteToken 関数
// トークンが存在する場合は削除し、存在しない場合はエラーを返します。
func (repo *InMemoryAuthRepository) DeleteToken(token string) error {
	if _, exists := repo.tokens[token]; !exists {
		return errors.New("token not found")
	}
	delete(repo.tokens, token)
	return nil
}

// GetTokensByUsername 関数
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

// GetUsernameByToken 関数
// トークンからユーザー名を取得するメソッドです。
func (repo *InMemoryAuthRepository) GetUsernameByToken(token string) (string, error) {
	username, exists := repo.tokens[token]
	if !exists {
		return "", errors.New("token not found")
	}
	return username, nil
}
