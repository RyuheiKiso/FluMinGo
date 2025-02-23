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
