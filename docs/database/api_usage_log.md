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

## 関係テーブル
- `user`: API利用者の情報を参照します。

## サンプルデータ

| id | user_id | endpoint         | method | response_time | status_code | created_at           |
|----|---------|------------------|--------|---------------|-------------|----------------------|
| 1  | 10      | /api/v1/items    | GET    | 150           | 200         | 2023-10-01 00:00:00  |
| 2  | 10      | /api/v1/users    | POST   | 300           | 201         | 2023-11-05 00:00:00  |
| 3  | 11      | /api/v1/orders   | GET    | 180           | 200         | 2023-12-01 00:00:00  |
| 4  | 12      | /api/v1/payments | POST   | 250           | 200         | 2023-12-15 00:00:00  |
| 5  | 13      | /api/v1/items    | PUT    | 220           | 200         | 2023-12-20 00:00:00  |
| 6  | 14      | /api/v1/orders   | DELETE | 180           | 204         | 2023-12-25 00:00:00  |
| 7  | 15      | /api/v1/items    | GET    | 160           | 200         | 2023-12-30 00:00:00  |
| 8  | 16      | /api/v1/users    | POST   | 310           | 201         | 2024-01-05 00:00:00  |
| 9  | 17      | /api/v1/orders   | GET    | 190           | 200         | 2024-01-10 00:00:00  |
| 10 | 18      | /api/v1/payments | POST   | 260           | 200         | 2024-01-15 00:00:00  |
| 11 | 19      | /api/v1/items    | GET    | 170           | 200         | 2024-01-20 00:00:00  |
| 12 | 20      | /api/v1/users    | POST   | 320           | 201         | 2024-01-25 00:00:00  |
| 13 | 21      | /api/v1/orders   | GET    | 200           | 200         | 2024-01-30 00:00:00  |
| 14 | 22      | /api/v1/payments | POST   | 270           | 200         | 2024-02-05 00:00:00  |
| 15 | 23      | /api/v1/items    | PUT    | 230           | 200         | 2024-02-10 00:00:00  |
| 16 | 24      | /api/v1/orders   | DELETE | 190           | 204         | 2024-02-15 00:00:00  |
| 17 | 25      | /api/v1/items    | GET    | 180           | 200         | 2024-02-20 00:00:00  |
| 18 | 26      | /api/v1/users    | POST   | 330           | 201         | 2024-02-25 00:00:00  |
| 19 | 27      | /api/v1/orders   | GET    | 210           | 200         | 2024-03-01 00:00:00  |
| 20 | 28      | /api/v1/payments | POST   | 280           | 200         | 2024-03-05 00:00:00  |
