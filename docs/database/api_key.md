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
