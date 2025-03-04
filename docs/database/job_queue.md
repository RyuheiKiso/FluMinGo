# ジョブキュー管理テーブル設計書

## 概要
バックグラウンド処理のジョブを管理し、非同期タスクの実行状況を記録します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `job_queue`

| カラム名       | データ型      | 制約                                      | 説明                                      |
|----------------|---------------|-------------------------------------------|-------------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT               | ジョブの一意な識別子                         |
| job_type       | VARCHAR(100)  | NOT NULL                                  | ジョブの種類（例: email_dispatch）         |
| payload        | TEXT          | NOT NULL                                  | ジョブ実行に必要なデータ（JSON形式推奨）      |
| status         | VARCHAR(50)   | NOT NULL, DEFAULT 'pending'               | ジョブの状態（例: pending, processing, completed, failed） |
| attempt_count  | INT           | NOT NULL, DEFAULT 0                       | 実行試行回数                                |
| error_message  | TEXT          | DEFAULT NULL                              | エラー発生時のメッセージ                      |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | ジョブ登録日時                              |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | ジョブ更新日時    |
| priority       | INT           | NOT NULL, DEFAULT 0                       | ジョブの優先度（0が最も低い）               |

## 備考
- 失敗したジョブの再試行などの運用ルールに応じた拡張を検討してください.
- ジョブの優先度設定、リトライ戦略、及び並列実行制御を含む設計を推奨します.
- ジョブの優先度設定、並列実行制御、及び再試行ロジックの実装を追加することを推奨します.

## 解決策
- ジョブキューに優先度カラムを追加し、処理順序を最適化する。
- 失敗時の再試行回数や間隔を設定し、適切なエラー処理を実装する。
- 並列処理のためのロック機構やキュー管理サーバーの利用を検討する。

## 固定値一覧
- status: pending, processing, completed, failed
- job_type: 例）email_dispatch

## サンプルデータ

| id | job_type         | payload               | status     | attempt_count | error_message | created_at           | updated_at           | priority |
|----|------------------|-----------------------|------------|---------------|---------------|----------------------|----------------------|----------|
| 1  | email_dispatch   | {"to": "test@ex.com"} | pending    | 0             | NULL          | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  | 0        |
| 2  | data_backup      | {"path": "/backup"}   | processing | 1             | NULL          | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  | 1        |
| 3  | report_generate  | {"report": "monthly"} | pending    | 0             | NULL          | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  | 0        |
| 4  | data_export      | {"export": "yearly"}  | pending    | 0             | NULL          | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  | 0        |
| 5  | data_migration   | {"migration": "user_data"} | pending | 0    | NULL          | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  | 0        |
| 6  | cleanup_task     | {"task": "old_logs"}       | pending | 0 | NULL | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  | 0        |
