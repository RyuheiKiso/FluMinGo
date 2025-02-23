package apidocs

import (
	"fmt"
	"log"
	"os"
	"os/exec"
)

// GenerateSwaggerDocs Swaggerドキュメントを自動生成する関数
// swagコマンドがインストールされている必要があります
func GenerateSwaggerDocs(config map[string]string) {
	// Check if swag is installed
	if _, err := exec.LookPath("swag"); err != nil {
		log.Fatalf("swag command not found: %v", err)
	}

	// Prepare command arguments
	args := []string{"init"}
	for key, value := range config {
		args = append(args, key, value)
	}

	cmd := exec.Command("swag", args...)
	cmd.Env = os.Environ()
	output, err := cmd.CombinedOutput()
	if err != nil {
		log.Printf("Swaggerドキュメント生成に失敗しました: %v, 出力: %s", err, string(output))
		return
	}

	log.Printf("Swaggerドキュメントが生成されました: %s", string(output))
}

// Swagger ドキュメントのバージョンを取得するメソッドを追加
func GetSwaggerVersion() (string, error) {
	cmd := exec.Command("swag", "--version")
	output, err := cmd.CombinedOutput()
	if err != nil {
		return "", fmt.Errorf("failed to get swag version: %w", err)
	}
	return string(output), nil
}
