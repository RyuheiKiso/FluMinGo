# API利用制限テーブル設計書

## 概要
各利用者に対してAPIアクセスの上限を設定し、利用状況とリセット時刻を管理します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `api_rate_limit`

| カラム名           | データ型       | 制約                                      | 説明                                   |
|--------------------|----------------|-------------------------------------------|----------------------------------------|
| id                 | INT            | PRIMARY KEY, AUTO_INCREMENT               | レコードの一意な識別子                   |
| user_id            | INT            | DEFAULT NULL                              | 利用者の識別子（`user` テーブル参照）   |
| endpoint           | VARCHAR(255)   | NOT NULL                                  | 対象APIエンドポイント                   |
| max_requests       | INT            | NOT NULL                                  | 期間内の最大リクエスト数                |
| remaining_requests | INT            | NOT NULL                                  | 現在の残りリクエスト数                  |
| reset_at           | DATETIME       | NOT NULL                                  | 利用制限リセット予定日時                |
| created_at         | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at         | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## 備考
- 利用状況に応じて残りリクエスト数を更新し、リセット処理を実施してください.

## サンプルデータ
| id | user_id | endpoint         | max_requests | remaining_requests | reset_at             | created_at           | updated_at           |
|----|---------|------------------|--------------|--------------------|----------------------|----------------------|----------------------|
| 1  | 10      | /api/v1/items    | 1000         | 500                | 2023-10-02 00:00:00  | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 11      | /api/v1/users    | 500          | 250                | 2023-11-02 00:00:00  | 2023-11-01 00:00:00  | 2023-11-01 00:00:00  |
