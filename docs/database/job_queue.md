# ジョブキュー管理テーブル設計書

## 概要
バックグラウンド処理のジョブを管理し、非同期タスクの実行状況を記録します。

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

## 備考
- 失敗したジョブの再試行などの運用ルールに応じた拡張を検討してください。
