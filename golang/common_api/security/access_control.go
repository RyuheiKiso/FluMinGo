package security

// CheckRBACAccess RBAC（ロールベース）アクセス制御のサンプル関数
// userRole: ユーザーのロール, requiredRole: 必要なロール
// 単純な比較により、アクセス可否を判定する
func CheckRBACAccess(userRole, requiredRole string) bool {
	return userRole == requiredRole
}

// CheckABACAccess ABAC（属性ベース）アクセス制御のサンプル関数
// userAttrs: ユーザーの属性、例: {"department": "sales"}
// resourceAttrs: リソースの属性、例: {"department": "sales"}
// ユーザーとリソースの "department" 属性を比較してアクセス可否を判定する
func CheckABACAccess(userAttrs, resourceAttrs map[string]string) bool {
	if userDept, ok := userAttrs["department"]; ok {
		if resDept, ok := resourceAttrs["department"]; ok {
			return userDept == resDept
		}
	}
	return false
}
