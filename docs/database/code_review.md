# コードレビュー管理テーブル設計書

## 概要
プルリクエストに対するコードレビューの内容、レビューア、承認状況、コメントなどを記録し、レビュー履歴のトラッキングや改善につなげます。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `code_review_log`

| カラム名          | データ型      | 制約                                      | 説明                                           |
|-------------------|---------------|-------------------------------------------|------------------------------------------------|
| id                | INT           | PRIMARY KEY, AUTO_INCREMENT               | レビュー記録の一意な識別子                         |
| pull_request_id   | INT           | NOT NULL                                  | プルリクエストの識別子（PR管理テーブル等と連携推奨）  |
| reviewer_id       | INT           | NOT NULL                                  | レビュー実施者のユーザー識別子（`user` テーブル参照） |
| approval_status   | VARCHAR(20)   | NOT NULL                                  | 承認状況（例: approved, changes_requested, commented）|
| review_comments   | TEXT          | DEFAULT NULL                              | レビューコメント、指摘事項                        |
| review_date       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レビュー実施日時                                 |
| created_at        | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                                |
| updated_at        | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                |

## 備考
- プルリクエストと連携するため、pull_request_id は対応するテーブルの外部キーとして設定してください。
- レビューの統計や改善指標として活用する設計を検討してください.
