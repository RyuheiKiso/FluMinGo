# API利用履歴テーブル設計書

## 概要
APIリクエストのエンドポイント、メソッド、レスポンスタイム等の利用履歴を記録します。

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
