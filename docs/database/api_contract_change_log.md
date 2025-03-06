# API契約変更ログテーブル設計書

## 概要
API仕様（エンドポイント、メソッド、リクエスト/レスポンス形式等）の変更履歴を記録し、双方の開発者が変更内容や影響範囲を把握できるようにします。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `api_contract_change_log`

| カラム名             | データ型      | 制約                                      | 説明                                            |
|----------------------|---------------|-------------------------------------------|-------------------------------------------------|
| id                   | INT           | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                                 |
| service_name         | VARCHAR(100)  | NOT NULL                                  | 対象サービス名またはモジュール名                   |
| api_endpoint         | VARCHAR(255)  | NOT NULL                                  | APIエンドポイント（例: /api/v1/items）             |
| http_method          | VARCHAR(10)   | NOT NULL                                  | HTTPメソッド（GET, POST, PUT, DELETE等）           |
| previous_contract    | TEXT          | DEFAULT NULL                              | 変更前のAPI仕様（JSON形式推奨）                   |
| updated_contract     | TEXT          | NOT NULL                                  | 変更後のAPI仕様（JSON形式推奨）                   |
| change_reason        | TEXT          | DEFAULT NULL                              | 変更理由または備考                                 |
| changed_by           | INT           | NOT NULL                                  | 変更を実施したユーザーの識別子（`user` テーブル参照）|
| changed_at           | DATETIME      | NOT NULL                                  | 変更実施日時                                    |
| created_at           | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                                |
| updated_at           | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                   |

## 備考
- 各API仕様の変更は、契約変更ログとして記録し、後から影響範囲や互換性対応策を把握できるようにしてください.

## 関係テーブル
- `user`: 変更を実施したユーザー情報を参照します。
- `api_documentation`: APIドキュメント情報を参照します。

## サンプルデータ
| id | service_name  | api_endpoint   | http_method | previous_contract                                  | updated_contract                                     | change_reason         | changed_by | changed_at           | created_at           |
|----|---------------|----------------|-------------|----------------------------------------------------|------------------------------------------------------|-----------------------|------------|----------------------|----------------------|
| 1  | OrderService  | /api/v1/orders | POST        | {"required": ["user_id", "order_id"]}              | {"required": ["user_id", "order_id", "amount"]}      | 注文情報拡大のため    | 1          | 2023-10-01 10:00:00  | 2023-10-01 10:00:00  |
| 2  | UserService   | /api/v1/users  | GET         | {"fields": ["id", "name"]}                         | {"fields": ["id", "name", "email"]}                  | ユーザー情報追加のため | 2          | 2023-10-05 10:00:00  | 2023-10-05 10:00:00  |
| 3  | ProductService| /api/v1/products| DELETE      | {"required": ["product_id"]}                       | {"required": ["product_id", "reason"]}               | 削除理由追加のため    | 3          | 2023-10-10 10:00:00  | 2023-10-10 10:00:00  |
