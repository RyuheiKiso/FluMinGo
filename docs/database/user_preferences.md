# ユーザー設定テーブル設計書

## 概要
各ユーザーの個別設定値（例: テーマ、言語、通知設定等）を管理します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `user_preferences`

| カラム名     | データ型     | 制約                              | 説明                           |
|--------------|--------------|-----------------------------------|--------------------------------|
| id           | INT          | PRIMARY KEY, AUTO_INCREMENT       | 設定の一意な識別子             |
| user_id      | INT          | NOT NULL                          | 対象ユーザーの識別子 (`user.id`) |
| preference_key   | VARCHAR(100)  | NOT NULL                        | 設定キー                       |
| preference_value | VARCHAR(255)  | DEFAULT NULL                    | 設定値                         |
| created_at   | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP | レコード作成日時             |
| updated_at   | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時 |

## 備考
- `user_id`は`user`テーブルへの外部キーとして設定してください.
- ユーザーごとに複数の設定を持たせる設計としています.
