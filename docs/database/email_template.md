# メールテンプレートテーブル設計書

## 概要
通知メールやご案内メールのテンプレートや内容を管理します。

## テーブル定義
- テーブル名: `email_template`

| カラム名      | データ型      | 制約                              | 説明                                   |
|---------------|---------------|-----------------------------------|----------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT       | テンプレートの一意な識別子                |
| template_name | VARCHAR(100)  | NOT NULL, UNIQUE                  | テンプレート名（例: welcome_email）      |
| subject       | VARCHAR(255)  | NOT NULL                          | メール件名                              |
| body          | TEXT          | NOT NULL                          | メール本文                              |
| locale        | VARCHAR(10)   | DEFAULT 'ja'                      | 言語/ロケール（例: ja, en）              |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP | レコード作成日時                       |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時 |

## 備考
- テンプレートは管理画面等で更新可能とし、キャッシュ更新処理と連携してください.

## 固定値一覧
- locale: デフォルトは "ja"
