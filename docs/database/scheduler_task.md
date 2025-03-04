# スケジューラータスク管理テーブル設計書

## 概要
定期実行タスクの設定、実行状況、次回実行予定日時などを管理します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `scheduler_task`

| カラム名     | データ型          | 制約                                      | 説明                                   |
|--------------|-------------------|-------------------------------------------|----------------------------------------|
| id           | INT               | PRIMARY KEY, AUTO_INCREMENT               | タスクの一意な識別子                     |
| task_name    | VARCHAR(100)      | NOT NULL, UNIQUE                          | タスク名（例: daily_backup）           |
| schedule     | VARCHAR(50)       | NOT NULL                                  | 実行スケジュール（Cron形式推奨）         |
| last_run_at  | DATETIME          | DEFAULT NULL                              | 最終実行日時                           |
| next_run_at  | DATETIME          | DEFAULT NULL                              | 次回実行予定日時                       |
| status       | VARCHAR(20)       | NOT NULL, DEFAULT 'pending'               | タスク状態（pending, running, completed, failed） |
| created_at   | DATETIME          | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at   | DATETIME          | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## サンプルデータ
| id | task_name     | schedule      | last_run_at          | next_run_at          | status    | created_at           | updated_at           |
|----|---------------|---------------|----------------------|----------------------|-----------|----------------------|----------------------|
| 1  | daily_backup  | 0 2 * * *     | 2023-10-01 02:00:00  | 2023-10-02 02:00:00  | pending   | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |

## 備考
- Cron形式のスケジュール設定を採用する場合、対応する解析ロジックの実装を検討してください.
