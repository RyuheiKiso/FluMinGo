# APIトークン管理テーブル設計書

## 概要
外部／内部APIの認証に使用するトークンを管理します。

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

## 備考
- トークンは必要に応じてローテーションおよび失効管理を実装してください。
