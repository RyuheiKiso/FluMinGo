# バグ報告テーブル設計書

## 概要
ユーザーやテスターから報告されるバグ情報を管理し、対応状況を追跡します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `bug_report`

| カラム名      | データ型      | 制約                                      | 説明                                  |
|---------------|---------------|-------------------------------------------|---------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | バグ報告の一意な識別子                  |
| user_id       | INT           | DEFAULT NULL                              | 報告者の識別子（`user` テーブル参照、未ログイン時はNULL） |
| title         | VARCHAR(255)  | NOT NULL                                  | バグのタイトル                        |
| description   | TEXT          | NOT NULL                                  | バグの詳細説明                        |
| severity      | VARCHAR(20)   | NOT NULL, DEFAULT 'low'                   | 重要度（low, medium, high）           |
| status        | VARCHAR(20)   | NOT NULL, DEFAULT 'open'                  | バグの状態（open, in_progress, resolved, closed） |
| resolved_at   | DATETIME      | DEFAULT NULL                              | 解決日時（解決済みの場合のみ記入）      |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                      |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時      |

## 備考
- バグ報告は対応状況に合わせて`status`を変更し、解決時に`resolved_at`に日時を記録してください。
- 必要に応じて添付ファイルや再現手順のカラム追加も検討してください。

## 関係テーブル
- `user`: バグ報告の投稿者情報を参照します。

## サンプルデータ

| id | user_id | title           | description       | severity | status       | resolved_at          | created_at           | updated_at           |
|----|---------|-----------------|-------------------|----------|--------------|----------------------|----------------------|----------------------|
| 1  | 10      | バグ1           | 詳細説明1         | low      | open         | NULL                 | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 11      | バグ2           | 詳細説明2         | medium   | in_progress  | NULL                 | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | 12      | バグ3           | 詳細説明3         | high     | resolved     | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 13      | バグ4           | 詳細説明4         | low      | closed       | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
