// Package user provides the interface definitions for User API
// ユーザーAPIのインターフェース定義を提供するパッケージです
package user

// ユーザーインターフェースの定義
// UserAPIはユーザーに関する操作を定義したインターフェースです
//
// GetUserは指定されたユーザーIDに対応するユーザー情報を取得します
//   id: ユーザーの識別子
//   戻り値: ユーザー情報（文字列）とエラー
//
// CreateUserは新規ユーザーを作成します
//   name: ユーザー名
//   戻り値: 作成されたユーザーのIDとエラー

type UserAPI interface {
	// GetUserはユーザー情報を取得するメソッドです
	GetUser(id int) (string, error) // ユーザーIDに基づくユーザー情報取得

	// CreateUserは新規ユーザーを作成するメソッドです
	CreateUser(name string) (int, error) // ユーザー名からユーザーを作成
}
