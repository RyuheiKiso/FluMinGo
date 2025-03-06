# バックアップログテーブル設計書

## 概要
システムのバックアップ処理の実行状況や結果、エラーメッセージを記録します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `backup_log`

| カラム名       | データ型      | 制約                                      | 説明                                      |
|----------------|---------------|-------------------------------------------|-------------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                          |
| backup_type    | VARCHAR(50)   | NOT NULL                                  | バックアップの種類（例: full, differential） |
| backup_file    | VARCHAR(255)  | NOT NULL                                  | バックアップファイルのパスまたは名称          |
| backup_status  | VARCHAR(20)   | NOT NULL                                  | 実行結果（success, failure）               |
| error_message  | TEXT          | DEFAULT NULL                              | バックアップ失敗時のエラーメッセージ           |
| started_at     | DATETIME      | NOT NULL                                  | バックアップ開始日時                         |
| finished_at    | DATETIME      | DEFAULT NULL                              | バックアップ完了日時（失敗時はNULLの可能性あり）   |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                           |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時               |

## 備考
- バックアップ実行後、処理結果に応じた通知や再実行処理と連携することを推奨します。
- 失敗時の詳細なエラー解析および原因追及のため、エラーメッセージの保存を行います.

## 関係テーブル
- `notification`: バックアップ結果の通知情報を管理する場合があります。

## サンプルデータ

| id | backup_type   | backup_file               | backup_status | error_message | started_at           | finished_at          | created_at           | updated_at           |
|----|---------------|---------------------------|---------------|---------------|----------------------|----------------------|----------------------|----------------------|
| 1  | full          | /backup/full_20231001.bak | success       | NULL          | 2023-10-01 00:00:00  | 2023-10-01 01:00:00  | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | differential  | /backup/diff_20231105.bak | failure       | "接続エラー"  | 2023-11-05 00:00:00  | NULL                 | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
