# ユーザーフィードバックテーブル設計書

## 概要
ユーザーからのフィードバック（UI改善、機能要望、バグ報告等）を記録し、フロントエンドおよびバックエンドでの改善に活用します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `user_feedback`

| カラム名       | データ型      | 制約                                    | 説明                                             |
|----------------|---------------|-----------------------------------------|--------------------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT             | フィードバックの一意な識別子                        |
| user_id        | INT           | DEFAULT NULL                            | 投稿者のユーザー識別子（`user` テーブル参照）        |
| module         | VARCHAR(100)  | DEFAULT NULL                            | 対象モジュールまたは画面名                           |
| feedback_type  | VARCHAR(50)   | NOT NULL                                | フィードバック種類（例: bug, suggestion, praise） |
| title          | VARCHAR(255)  | NOT NULL                                | フィードバックのタイトル                         |
| content        | TEXT          | NOT NULL                                | フィードバックの詳細内容                         |
| rating         | INT           | DEFAULT NULL                            | 評価点（例: 1～5）                                  |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP     | 投稿日時                                        |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時          |

## サンプルデータ
| id | user_id | module | feedback_type | title | content | rating | created_at           | updated_at           |
|----|---------|--------|---------------|-------|---------|--------|----------------------|----------------------|
| 1  | 1       | UI     | praise        | Great app! | UIが使いやすいです。 | 5      | 2023-01-15 00:00:00  | 2023-01-15 00:00:00  |
| 2  | 1       | UI     | praise        | Great app! | "Great app!" | 5      | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 3  | 2       | Backend| bug           | Error 500 | サーバーエラーが発生します。 | NULL   | 2023-10-02 00:00:00  | 2023-10-02 00:00:00  |
| 4  | 3       | UI     | suggestion    | Improve UX | ナビゲーションを改善してください。 | 4      | 2023-10-03 00:00:00  | 2023-10-03 00:00:00  |

## 備考
- 集計結果により改善ポイントの傾向分析が可能です.

## 関係テーブル
- `user`: フィードバックの投稿者情報を参照します。
