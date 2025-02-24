package feature_flags

// フィーチャーフラグ管理機能の実装

// FeatureFlag はフィーチャーフラグの構造体です。
type FeatureFlag struct {
	Name    string
	Enabled bool
}

// FeatureFlagManager はフィーチャーフラグを管理する構造体です。
type FeatureFlagManager struct {
	flags map[string]FeatureFlag
}

// NewFeatureFlagManager は新しいFeatureFlagManagerを作成します。
func NewFeatureFlagManager() *FeatureFlagManager {
	return &FeatureFlagManager{
		flags: make(map[string]FeatureFlag),
	}
}

// AddFlag は新しいフィーチャーフラグを追加します。
func (ffm *FeatureFlagManager) AddFlag(name string, enabled bool) {
	ffm.flags[name] = FeatureFlag{Name: name, Enabled: enabled}
}

// IsEnabled はフィーチャーフラグが有効かどうかを確認します。
func (ffm *FeatureFlagManager) IsEnabled(name string) bool {
	flag, exists := ffm.flags[name]
	if !exists {
		return false
	}
	return flag.Enabled
}

// SetFlag はフィーチャーフラグの状態を設定します。
func (ffm *FeatureFlagManager) SetFlag(name string, enabled bool) {
	if _, exists := ffm.flags[name]; exists {
		ffm.flags[name] = FeatureFlag{Name: name, Enabled: enabled}
	}
}

// RemoveFlag はフィーチャーフラグを削除します。
func (ffm *FeatureFlagManager) RemoveFlag(name string) {
	delete(ffm.flags, name)
}
