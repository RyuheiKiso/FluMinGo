# UIインタラクションログテーブル設計書

## 概要
ユーザーがフロントエンド上で行った操作（ページビュー、クリック、ホバー等）を記録し、ユーザー行動分析やUI改善に役立てるテーブルです。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `ui_interaction_log`

| カラム名      | データ型       | 制約                                      | 説明                                        |
|---------------|----------------|-------------------------------------------|---------------------------------------------|
| id            | INT            | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                           |
| user_id       | INT            | DEFAULT NULL                              | 操作実行者の識別子（`user` テーブル参照）     |
| page_url      | VARCHAR(255)   | NOT NULL                                  | 操作が行われたページのURL                    |
| event_type    | VARCHAR(50)    | NOT NULL                                  | イベントの種類（例: click, view, hover等）     |
| event_details | TEXT           | DEFAULT NULL                              | 詳細な操作情報（例: クリック対象の要素等）       |
| ip_address    | VARCHAR(45)    | DEFAULT NULL                              | 操作時のIPアドレス                           |
| occurred_at   | DATETIME       | NOT NULL                                  | 操作発生日時                               |
| created_at    | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | ログ記録日時                                |
| updated_at    | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | ログ更新日時            |

## 備考
- 定期的な集計・分析により、UI改善やユーザー行動分析の基盤として活用してください.
