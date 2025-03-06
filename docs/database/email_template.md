# メールテンプレートテーブル設計書

## 概要
通知メールやご案内メールのテンプレートや内容を管理します。

## テーブル種類
- マスタ系

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

## 関係テーブル
- `notification`: 通知情報を管理する場合があります。

## サンプルデータ

| id | template_name   | subject            | body                         | locale | created_at           | updated_at           |
|----|-----------------|--------------------|------------------------------|--------|----------------------|----------------------|
| 1  | welcome_email   | ようこそ！         | サンプル本文です             | ja     | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | reset_password  | パスワードリセット | リセット手続きのご案内       | ja     | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | newsletter      | 月間ニュース       | 最新情報をお届けします      | ja     | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | promo_email     | スペシャルオファー | プロモーションメールの本文 | ja     | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | reminder_email  | リマインダー       | 定期リマインダーの本文       | ja     | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | survey_email    | アンケートのお願い | ユーザーアンケートのご案内   | ja     | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
