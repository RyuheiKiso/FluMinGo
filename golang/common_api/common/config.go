package common

import (
	"encoding/json"
	"os"
)

// Config は設定管理のための構造体です。
type Config struct {
	settings map[string]interface{}
}

// NewConfig は新しい Config インスタンスを作成します。
func NewConfig() *Config {
	return &Config{
		settings: make(map[string]interface{}),
	}
}

// Load は設定ファイルから設定を読み込みます。
func (c *Config) Load(filePath string) error {
	file, err := os.Open(filePath)
	if err != nil {
		return err
	}
	defer file.Close()

	decoder := json.NewDecoder(file)
	return decoder.Decode(&c.settings)
}

// Get は設定値を取得します。
func (c *Config) Get(key string) (interface{}, bool) {
	value, exists := c.settings[key]
	return value, exists
}

// Set は設定値を設定します。
func (c *Config) Set(key string, value interface{}) {
	c.settings[key] = value
}

// Save は現在の設定をファイルに保存するメソッドです。
func (c *Config) Save(filePath string) error {
	file, err := os.Create(filePath)
	if err != nil {
		return err
	}
	defer file.Close()
	encoder := json.NewEncoder(file)
	return encoder.Encode(c.settings)
}
