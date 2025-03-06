# APIキー管理テーブル設計書

## 概要
外部システム連携や内部API認証のためのAPIキー情報を管理します。

## テーブル種類
- マスタ系

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
- APIキーの有効期限管理、定期的なローテーション、および利用状況の監査を推奨します。
- APIキーの有効期限管理、定期的なローテーション、および監査ログ連携を実施することを推奨します.

## 解決策
- APIキーの有効期限を管理するロジックを実装する（例：定期バッチで期限切れチェック）。
- キーローテーションの仕組みを導入し、新旧キーのスムーズな移行を行う。
- 監査ログと連携し、不正利用の兆候を検知する仕組みを整備する。

## 関係テーブル
- `user`: APIキーの所有者情報を参照します。

## サンプルデータ

| id | user_id | key           | description         | created_at           | updated_at           |
|----|---------|---------------|---------------------|----------------------|----------------------|
| 1  | 10      | abcdef123456  | Main API key sample | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 11      | zyxwvu654321  | Secondary API key   | 2023-11-01 00:00:00  | 2023-11-01 00:00:00  |
| 3  | 12      | qwerty098765  | Tertiary API key    | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 13      | asdfgh123456  | Quaternary API key  | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | 14      | new_key_777777| New API key sample  | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | 15      | another_key_888888| Another API key sample | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
| 7  | 16      | key_example_999999| Seventh API key sample | 2024-01-01 00:00:00  | 2024-01-01 00:00:00  |
| 8  | 17      | key_example_aaaaaa| Eighth API key sample | 2024-01-05 00:00:00  | 2024-01-05 00:00:00  |
| 9  | 18      | key_example_bbbbbb| Ninth API key sample | 2024-01-10 00:00:00  | 2024-01-10 00:00:00  |
| 10 | 19      | key_example_cccccc| Tenth API key sample | 2024-01-15 00:00:00  | 2024-01-15 00:00:00  |
