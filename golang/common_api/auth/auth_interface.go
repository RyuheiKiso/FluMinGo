// Package auth provides the authentication API contract.
package auth

// AuthAPI defines the contract for authentication operations.
// Implementations should provide login and logout functionalities.

type AuthAPI interface {
	Login(username, password string) (string, error) // Returns token on success
	Logout(token string) error
	SaveToken(username, token string) error
	DeleteToken(token string) error
	GetTokensByUsername(username string) ([]string, error) // 追加
	DeleteTokensByUsername(username string) error          // 追加
}

// Authenticator defines the contract for authentication.
type Authenticator interface {
	Authenticate(username, password string) (bool, error)
	Login(username, password string) (string, error)
	Logout(token string) error
	DeleteAllTokens(username string) error                 // 追加
	GetTokensByUsername(username string) ([]string, error) // ユーザーのトークンをすべて削除するメソッドを追加
}
