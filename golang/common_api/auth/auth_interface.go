// auth_interface.go ファイル
// このファイルは、認証APIの契約を提供します。

// Package auth provides the authentication API contract.
package auth

// AuthAPI インターフェース
// 認証操作の契約を定義します。
// 実装はログインとログアウトの機能を提供する必要があります。
type AuthAPI interface {
	Login(username, password string) (string, error) // 成功時にトークンを返します
	Logout(token string) error
	SaveToken(username, token string) error
	DeleteToken(token string) error
	GetTokensByUsername(username string) ([]string, error) // 追加
	DeleteTokensByUsername(username string) error          // 追加
}

// Authenticator インターフェース
// 認証の契約を定義します。
type Authenticator interface {
	Authenticate(username, password string) (bool, error)
	Login(username, password string) (string, error)
	Logout(token string) error
	DeleteAllTokens(username string) error                 // 追加
	GetTokensByUsername(username string) ([]string, error) // ユーザーのトークンをすべて削除するメソッドを追加
	ResetPassword(username, newPassword string) error      // 追加
	RefreshToken(token string) (string, error)             // トークンをリフレッシュするメソッドを追加
}
