# API利用履歴テーブル設計書

## 概要
APIリクエストのエンドポイント、メソッド、レスポンスタイム等の利用履歴を記録します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `api_usage_log`

| カラム名      | データ型      | 制約                              | 説明                                        |
|---------------|---------------|-----------------------------------|---------------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT       | レコードの一意な識別子                       |
| user_id       | INT           | DEFAULT NULL                      | API利用者の識別子 (`user.id`)                |
| endpoint      | VARCHAR(255)  | NOT NULL                          | アクセスしたAPIのURLパス                     |
| method        | VARCHAR(10)   | NOT NULL                          | HTTPメソッド (GET,POST等)                    |
| response_time | INT           | DEFAULT NULL                      | レスポンスタイム（ミリ秒単位）                |
| status_code   | INT           | DEFAULT NULL                      | HTTPレスポンスステータス                     |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP | ログ作成日時                               |

## 備考
- レスポンスタイムやステータスコードにより、APIのパフォーマンスとエラー傾向を分析できます.

## 固定値一覧
- method: GET, POST, PUT, DELETE など（HTTPメソッド）

## サンプルデータ

| id | user_id | endpoint         | method | response_time | status_code | created_at           |
|----|---------|------------------|--------|---------------|-------------|----------------------|
| 1  | 10      | /api/v1/items    | GET    | 150           | 200         | 2023-10-01 00:00:00  |
| 2  | 10      | /api/v1/users    | POST   | 300           | 201         | 2023-11-05 00:00:00  |
| 3  | 11      | /api/v1/orders   | GET    | 180           | 200         | 2023-12-01 00:00:00  |
| 4  | 12      | /api/v1/payments | POST   | 250           | 200         | 2023-12-15 00:00:00  |
| 5  | 13      | /api/v1/items    | PUT    | 220           | 200         | 2023-12-20 00:00:00  |
| 6  | 14      | /api/v1/orders   | DELETE | 180           | 204         | 2023-12-25 00:00:00  |
