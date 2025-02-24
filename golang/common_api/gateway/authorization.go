package gateway

import (
	"errors"
	"fmt"
	"net/http"
)

// CheckAuthorization verifies if the incoming HTTP request contains valid authorization credentials.
// For demonstration, it simply checks for the presence of the "Authorization" header.
func CheckAuthorization(r *http.Request) error {
	if r.Header.Get("Authorization") == "" {
		return errors.New("missing authorization header")
	}
	// ...additional authorization logic can be implemented here...
	return nil
}

// CheckAuthorizationWithRole はロールに基づいて認証を確認します。
func CheckAuthorizationWithRole(r *http.Request, role string) error {
	if err := CheckAuthorization(r); err != nil {
		return err
	}
	// ロールベースの認証ロジックをここに追加します。
	return nil
}

// CheckAuthorizationWithLogging は認証を確認し、ログを出力します。
func CheckAuthorizationWithLogging(r *http.Request) error {
	fmt.Println("Checking authorization for request:", r.Method, r.URL.Path)
	return CheckAuthorization(r)
}
