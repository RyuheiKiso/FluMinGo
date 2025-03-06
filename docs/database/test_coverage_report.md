# テストカバレッジレポートテーブル設計書

## 概要
自動テストのカバレッジ結果を記録し、品質管理や改善の指標として利用するためのテーブルです。

## テーブル種類
- レポート系

## テーブル定義
- テーブル名: `test_coverage_report`

| カラム名         | データ型      | 制約                                      | 説明                                    |
|------------------|---------------|-------------------------------------------|-----------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT               | レポートの一意な識別子                    |
| project_name     | VARCHAR(100)  | NOT NULL                                  | プロジェクト名またはモジュール名            |
| coverage_percent | DECIMAL(5,2)  | NOT NULL                                  | カバレッジ率（例: 85.50）                  |
| report_date      | DATE          | NOT NULL                                  | レポート作成日                          |
| details          | TEXT          | DEFAULT NULL                              | 詳細なレポート内容や備考                   |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                        |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## 備考
- テスト実行パイプラインと連携し、定期的に自動でレコードを追加する仕組みが望ましいです.

## 関係テーブル
- `ci_pipeline`: テストカバレッジレポートの生成元パイプライン情報を参照する場合があります。

## サンプルデータ
| id | report_name  | total_tests | passed_tests | coverage_percentage | created_at           |
|----|--------------|-------------|--------------|---------------------|----------------------|
| 1  | Unit Tests   | 100         | 95           | 95.0                | 2023-10-01 00:00:00  |
| 2  | Integration Tests | 50     | 45           | 90.0                | 2023-10-02 00:00:00  |
| 3  | E2E Tests    | 30          | 28           | 93.3                | 2023-10-03 00:00:00  |
