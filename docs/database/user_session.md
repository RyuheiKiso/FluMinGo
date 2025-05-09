# ユーザーセッションテーブル設計書

## 概要
ユーザーのログインセッション情報を管理するテーブルです。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `user_session`

| カラム名       | データ型      | 制約                                      | 説明                                  |
|----------------|---------------|-------------------------------------------|---------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT               | セッションの一意な識別子               |
| user_id        | INT           | NOT NULL, FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) | 対象ユーザーの識別子（`user` テーブル参照）|
| session_token  | VARCHAR(255)  | NOT NULL, UNIQUE                          | セッショントークン                     |
| expires_at     | DATETIME      | NOT NULL                                  | セッション有効期限                     |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時   |

## サンプルデータ

| id | user_id | session_token               | expires_at           | created_at           | updated_at           |
|----|---------|-----------------------------|----------------------|----------------------|----------------------|
| 1  | 10      | sessiontoken_example_1234  | 2023-10-10 23:59:59  | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 10      | sessiontoken_example_5678  | 2023-12-31 23:59:59  | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | 11      | sessiontoken_example_9999  | 2024-01-15 23:59:59  | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 12      | sessiontoken_example_aaaa  | 2024-02-15 23:59:59  | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | 13      | sessiontoken_example_bbbb  | 2024-03-01 23:59:59  | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | 14      | sessiontoken_example_cccc  | 2024-03-15 23:59:59  | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
| 7  | 15      | sessiontoken_example_dddd  | 2024-04-01 23:59:59  | 2024-01-01 00:00:00  | 2024-01-01 00:00:00  |
| 8  | 16      | sessiontoken_example_eeee  | 2024-04-15 23:59:59  | 2024-01-15 00:00:00  | 2024-01-15 00:00:00  |

## 備考
- `user_id`は`user`テーブルの主キーへの外部キーとして設定してください。
- セッショントークンは十分なランダム性を持たせ、セキュリティ強化を行ってください。
- セッション有効期限の短縮や自動ログアウト設定についても検討してください.

## 関係テーブル
- `user`: セッションの所有者情報を参照します。
- `session_activity_log`: セッションのアクティビティログを管理します。

## 解決策
- 外部キー制約（fk_user）の導入でデータ整合性を保証する。
- セッション管理ロジックにより、有効期限切れチェックと自動ログアウト処理を実装する。
