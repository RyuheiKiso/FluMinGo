package analytics

import (
	"encoding/csv"
	"encoding/json"
	"fmt"
	"log"
	"os"
)

// UsageReport は API 利用状況の分析とレポート機能を提供する
// 必要に応じて内部状態やデータソースを保持する

type UsageReport struct {
	data []map[string]interface{}
}

// NewUsageReport は UsageReport の新しいインスタンスを生成する
func NewUsageReport(data []map[string]interface{}) *UsageReport {
	return &UsageReport{data: data}
}

// GenerateReport は API 利用状況のレポートを生成して返す
func (ur *UsageReport) GenerateReport(format string) (string, error) {
	var report string
	var err error

	switch format {
	case "json":
		report, err = ur.generateJSONReport()
	case "csv":
		report, err = ur.generateCSVReport()
	default:
		report, err = ur.generateTextReport()
	}

	if err != nil {
		log.Printf("レポート生成に失敗しました: %v", err)
		return "", err
	}

	log.Println("レポートが生成されました:", report)
	return report, nil
}

func (ur *UsageReport) generateJSONReport() (string, error) {
	jsonData, err := json.Marshal(ur.data)
	if err != nil {
		return "", fmt.Errorf("JSONレポート生成に失敗しました: %w", err)
	}
	return string(jsonData), nil
}

func (ur *UsageReport) generateCSVReport() (string, error) {
	file, err := os.Create("usage_report.csv")
	if err != nil {
		return "", fmt.Errorf("CSVファイル作成に失敗しました: %w", err)
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	// Assuming all maps have the same keys
	if len(ur.data) > 0 {
		headers := make([]string, 0, len(ur.data[0]))
		for key := range ur.data[0] {
			headers = append(headers, key)
		}
		if err := writer.Write(headers); err != nil {
			return "", fmt.Errorf("CSVヘッダー書き込みに失敗しました: %w", err)
		}
		for _, record := range ur.data {
			row := make([]string, len(headers))
			for i, header := range headers {
				row[i] = fmt.Sprintf("%v", record[header])
			}
			if err := writer.Write(row); err != nil {
				return "", fmt.Errorf("CSV行書き込みに失敗しました: %w", err)
			}
		}
	}

	return "usage_report.csv", nil
}

func (ur *UsageReport) generateTextReport() (string, error) {
	report := "API 利用状況レポート: ダミーデータ"
	fmt.Println(report)
	return report, nil
}
