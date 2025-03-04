# セッション管理テーブル設計書

## 概要
ユーザーのログインセッション情報を管理するテーブルです。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `user_session`

| カラム名       | データ型      | 制約                                      | 説明                                  |
|----------------|---------------|-------------------------------------------|---------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT               | セッションの一意な識別子               |
| user_id        | INT           | NOT NULL                                  | 対象ユーザーの識別子（`user` テーブル参照）|
| session_token  | VARCHAR(255)  | NOT NULL, UNIQUE                          | セッショントークン                     |
| expires_at     | DATETIME      | NOT NULL                                  | セッション有効期限                     |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時   |

## 備考
- `user_id`は`user`テーブルの主キーへの外部キーとして設定してください。
- セッショントークンは十分なランダム性を持たせ、セキュリティ強化を行ってください。
- セッション有効期限の短縮や自動ログアウト設定についても検討してください.

## 解決策
- 外部キー制約（fk_user）の導入でデータ整合性を保証する。
- セッション管理ロジックにより、有効期限切れチェックと自動ログアウト処理を実装する。
