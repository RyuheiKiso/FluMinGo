# APIキー管理テーブル設計書

## 概要
外部システム連携や内部API認証のためのAPIキー情報を管理します。

## テーブル定義
- テーブル名: `api_key`

| カラム名      | データ型      | 制約                                      | 説明                                      |
|---------------|---------------|-------------------------------------------|-------------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | APIキーの一意な識別子                         |
| user_id       | INT           | DEFAULT NULL                              | オーナーとなるユーザーの識別子（任意：`user` 参照） |
| key           | VARCHAR(255)  | NOT NULL, UNIQUE                          | APIキー                                   |
| description   | TEXT          | DEFAULT NULL                              | APIキーの用途・説明                          |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                            |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時    |

## 備考
- 必要に応じて、ユーザー情報とのリレーションを検討してください。
