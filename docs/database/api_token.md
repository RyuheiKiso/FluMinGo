# APIトークン管理テーブル設計書

## 概要
外部／内部APIの認証に使用するトークンを管理します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `api_token`

| カラム名       | データ型      | 制約                                      | 説明                                  |
|----------------|---------------|-------------------------------------------|---------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT               | トークンの一意な識別子                  |
| user_id        | INT           | DEFAULT NULL                              | 利用者ID（ある場合、`user`テーブル参照）|
| token          | VARCHAR(255)  | NOT NULL, UNIQUE                          | APIアクセストークン                   |
| description    | TEXT          | DEFAULT NULL                              | トークンの用途や備考                    |
| expires_at     | DATETIME      | DEFAULT NULL                              | トークンの有効期限                      |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時   |

## サンプルデータ

| id | user_id | token             | description         | expires_at           | created_at           | updated_at           |
|----|---------|-------------------|---------------------|----------------------|----------------------|
| 1  | 10      | token_example_123 | 初回APIトークン     | 2023-12-31 23:59:59  | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 11      | token_example_456 | Secondary API token | 2024-01-31 23:59:59  | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | 12      | token_example_789 | Tertiary API token  | 2024-02-28 23:59:59  | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 13      | token_example_999 | Quaternary API token| 2024-03-31 23:59:59  | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | 14      | token_example_cccc| Fifth API token     | 2024-04-30 23:59:59  | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | 15      | token_example_dddd| Sixth API token     | 2024-05-31 23:59:59  | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
| 7  | 16      | token_example_eeee| Seventh API token   | 2024-06-30 23:59:59  | 2023-12-30 00:00:00  | 2023-12-30 00:00:00  |
| 8  | 17      | token_example_ffff| Eighth API token    | 2024-07-31 23:59:59  | 2024-01-01 00:00:00  | 2024-01-01 00:00:00  |
| 9  | 18      | token_example_gggg| Ninth API token     | 2024-08-31 23:59:59  | 2024-01-05 00:00:00  | 2024-01-05 00:00:00  |
| 10 | 19      | token_example_hhhh| Tenth API token     | 2024-09-30 23:59:59  | 2024-01-10 00:00:00  | 2024-01-10 00:00:00  |

## 備考
- トークンは必要に応じてローテーションおよび失効管理を実装してください.
- トークン利用状況の監視、失効時のアクセス制限の強化などセキュリティ対策も合わせて検討してください.
- 定期的なトークンローテーションと失効管理の仕組みを導入し、利用状況の監視を実施すること.

## 解決策
- トークンの有効期限管理と定期ローテーションのための仕組みをシステム内に実装する。
- 利用状況を監視し、異常が検知された場合に即時失効させる自動監視システムを導入する。

## 関係テーブル
- `user`: トークンの所有者情報を参照します。
