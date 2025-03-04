# 通知テーブル設計書

## 概要
ユーザーに対してシステムからの通知情報を管理するテーブルです。

## テーブル定義
- テーブル名: `notification`

| カラム名           | データ型      | 制約                                      | 説明                                  |
|--------------------|---------------|-------------------------------------------|---------------------------------------|
| id                 | INT           | PRIMARY KEY, AUTO_INCREMENT               | 通知の一意な識別子                     |
| user_id            | INT           | NOT NULL                                  | 対象ユーザーの識別子（`user` テーブル参照）|
| notification_type  | VARCHAR(50)   | NOT NULL                                  | 通知の種類（例: info, warning, alert） |
| message            | TEXT          | NOT NULL                                  | 通知メッセージ                         |
| is_read            | BOOLEAN       | NOT NULL, DEFAULT FALSE                   | 既読状態                              |
| created_at         | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | 通知作成日時                          |
| updated_at         | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | 通知更新日時           |

## 備考
- `user_id`は`user`テーブルの主キーへの外部キーとして設定してください。
