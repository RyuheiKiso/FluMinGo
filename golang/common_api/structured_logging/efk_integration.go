package structured_logging

import (
	"os"

	"github.com/sirupsen/logrus"
)

// EFKスタックを利用した構造化ロギングと可視化
func InitEFKLogging() {
	logrus.SetFormatter(&logrus.JSONFormatter{})
	logrus.SetOutput(os.Stdout)
	logrus.SetLevel(logrus.InfoLevel)
}

// LogStructuredData は構造化データをログに記録するメソッドです。
func LogStructuredData(data map[string]interface{}) {
	// 実際のロギング処理をここに追加します。
}
