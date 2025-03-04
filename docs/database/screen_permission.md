# 機能アクセス権限テーブル設計書

## 概要
各ユーザーがアプリケーション内の各画面に対して、参照、登録、更新、削除の各権限を管理するテーブルです。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `screen_permission`

| カラム名       | データ型      | 制約                                                     | 説明                                               |
|----------------|---------------|----------------------------------------------------------|----------------------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT                              | テーブルの一意な識別子                             |
| user_id        | INT           | NOT NULL                                                 | 対象ユーザーの識別子 (`user` テーブルの `id`)      |
| screen_id      | INT           | NOT NULL                                                 | 画面の識別子。各画面に割り振られた数値識別子         |
| can_read       | BOOLEAN       | NOT NULL, DEFAULT FALSE                                  | ユーザーが画面を参照可能かを示す                     |
| can_create     | BOOLEAN       | NOT NULL, DEFAULT FALSE                                  | ユーザーが画面に新規データを登録可能かを示す         |
| can_update     | BOOLEAN       | NOT NULL, DEFAULT FALSE                                  | ユーザーが画面のデータを更新可能かを示す             |
| can_delete     | BOOLEAN       | NOT NULL, DEFAULT FALSE                                  | ユーザーが画面のデータを削除可能かを示す             |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP                      | レコード作成日時                                  |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                   |

## 備考
- `user_id`は`user`テーブルの主キーを参照する外部キーとして設定してください.
- ユーザー権限のデフォルト設定や、グループ権限との併用に留意した設計を検討してください.
- user_idおよびscreen_idに対する外部キー制約の有効化と、初期権限設定の明示的初期化を検討すること.
-- ALTER TABLE screen_permission ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id);
-- ALTER TABLE screen_permission ADD CONSTRAINT fk_screen FOREIGN KEY (screen_id) REFERENCES screen(id);

## 解決策
- データベース側で外部キー制約を定義し、データ整合性を確保する。
- 初期権限値を定義し、必要に応じたデフォルト設定をアプリケーションで管理する。

## サンプルデータ

| id | user_id | screen_id | can_read | can_create | can_update | can_delete | created_at           | updated_at           |
|----|---------|-----------|----------|------------|------------|------------|----------------------|----------------------|
| 1  | 10      | 1         | TRUE     | FALSE      | TRUE       | FALSE      | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 10      | 2         | TRUE     | TRUE       | FALSE      | FALSE      | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | 11      | 3         | FALSE    | FALSE      | TRUE       | TRUE       | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 12      | 4         | TRUE     | FALSE      | TRUE       | FALSE      | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | 13      | 5         | TRUE     | TRUE       | TRUE       | TRUE       | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | 14      | 6         | TRUE     | FALSE      | TRUE       | FALSE      | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
