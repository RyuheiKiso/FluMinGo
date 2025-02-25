package security

import "html"

// CSRF/XSSセキュリティの実装

// SanitizeInput 入力をエスケープしてXSS対策を行う関数
func SanitizeInput(input string) string {
	return html.EscapeString(input)
}

// ValidateCSRFToken CSRFトークンの検証関数の例
func ValidateCSRFToken(token, expectedToken string) bool {
	// 簡易的な比較。実際の運用ではセッション等と連携することが推奨される
	return token == expectedToken
}
