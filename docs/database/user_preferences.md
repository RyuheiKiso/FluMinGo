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

## サンプルデータ

| id | user_id | preference_key | preference_value | created_at           | updated_at           |
|----|---------|----------------|------------------|----------------------|----------------------|
| 1  | 10      | theme          | dark             | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 10      | language       | en               | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | 11      | notification   | enabled          | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 12      | timezone       | JST              | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | 13      | font_size      | medium           | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | 14      | layout         | compact          | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |

## 備考
- `user_id`は`user`テーブルへの外部キーとして設定してください.
- ユーザーごとに複数の設定を持たせる設計としています.
