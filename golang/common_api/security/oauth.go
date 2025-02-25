package security

import (
	"errors"
	"time"

	"github.com/dgrijalva/jwt-go"
)

// OAuthセキュリティの実装
// jwtSecret はJWT署名用のシークレットキー。実際の運用では環境変数等で管理することを推奨。
var jwtSecret = []byte("your_secret_key_here")

// GenerateToken ユーザーIDをもとにJWTトークンを生成する関数
func GenerateToken(userID string) (string, error) {
	// 標準クレームの設定
	claims := jwt.StandardClaims{
		Subject:   userID,
		ExpiresAt: time.Now().Add(24 * time.Hour).Unix(),
		IssuedAt:  time.Now().Unix(),
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	// トークンの署名を生成して返す
	return token.SignedString(jwtSecret)
}

// ValidateToken JWTトークンの検証を行い、ユーザーIDを返す
func ValidateToken(tokenString string) (string, error) {
	token, err := jwt.ParseWithClaims(tokenString, &jwt.StandardClaims{}, func(token *jwt.Token) (interface{}, error) {
		return jwtSecret, nil
	})
	if err != nil {
		return "", err
	}

	claims, ok := token.Claims.(*jwt.StandardClaims)
	if !ok || !token.Valid {
		return "", errors.New("無効なトークンです")
	}
	return claims.Subject, nil
}
