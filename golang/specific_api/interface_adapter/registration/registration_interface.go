// Package registration provides the interface definitions for User Registration API
// ユーザー登録APIのインターフェース定義を提供するパッケージです
package registration

// 登録インターフェースの定義
// RegistrationAPIはユーザー登録に関する操作を定義したインターフェースです
//
// RegisterUserは新規ユーザー登録を行います
//   username: 登録するユーザー名
//   email: ユーザーのメールアドレス
//   password: ユーザーのパスワード
//   戻り値: 登録されたユーザーのIDとエラー
//
// GetRegistrationStatusは指定されたユーザーIDの登録状況を取得します
//   userID: ユーザーの識別子
//   戻り値: 登録状態の文字列とエラー

type RegistrationAPI interface {
	// RegisterUserはユーザーの新規登録を行うメソッドです
	RegisterUser(username, email, password string) (int, error) // ユーザー登録

	// GetRegistrationStatusは指定したユーザーの登録状況を取得するメソッドです
	GetRegistrationStatus(userID int) (string, error) // 登録状況取得
}
