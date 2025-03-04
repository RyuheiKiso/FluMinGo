# 静的コード解析レポートテーブル設計書

## 概要
各種静的解析ツールの実行結果を記録し、ソースコードの品質向上、脆弱性検出、改善点把握に役立てるテーブルです。

## テーブル種類
- レポート系

## テーブル定義
- テーブル名: `static_code_analysis_report`

| カラム名              | データ型      | 制約                                      | 説明                                                     |
|-----------------------|---------------|-------------------------------------------|----------------------------------------------------------|
| id                    | INT           | PRIMARY KEY, AUTO_INCREMENT               | レポートの一意な識別子                                     |
| project_name          | VARCHAR(100)  | NOT NULL                                  | プロジェクト名またはモジュール名                           |
| analysis_tool         | VARCHAR(100)  | NOT NULL                                  | 解析ツール名（例: ESLint, SonarQube, Pylint等）             |
| report_date           | DATETIME      | NOT NULL                                  | 解析実施日時                                             |
| total_findings        | INT           | DEFAULT 0                                 | 抽出された課題・警告件数                                   |
| critical_findings     | INT           | DEFAULT 0                                 | 重大な問題件数                                           |
| summary               | TEXT          | DEFAULT NULL                              | レポート概要、コメント等                                   |
| details               | TEXT          | DEFAULT NULL                              | 詳細な解析結果（JSON形式推奨）                             |
| created_at            | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                                         |
| updated_at            | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                         |

## 備考
- 定期的な静的解析と結果の集計により、品質改善の傾向を把握できます。
- 解析ツールとの連携および結果の可視化基盤として活用してください.
