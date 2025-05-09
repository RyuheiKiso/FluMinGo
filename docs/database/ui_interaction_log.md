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

## サンプルデータ
| id | user_id | page_url      | event_type | event_details | ip_address | occurred_at           | created_at           | updated_at           |
|----|---------|---------------|------------|---------------|------------|-----------------------|----------------------|----------------------|
| 1  | 1       | /home         | click      | NULL          | NULL       | 2023-10-01 10:00:00   | 2023-10-01 10:00:00  | 2023-10-01 10:00:00  |
| 2  | 2       | /profile      | view       | NULL          | 192.168.1.1| 2023-10-02 11:00:00   | 2023-10-02 11:00:00  | 2023-10-02 11:00:00  |
| 3  | 1       | /settings     | hover      | {"element": "save_button"} | 192.168.1.2 | 2023-10-03 12:00:00   | 2023-10-03 12:00:00  | 2023-10-03 12:00:00  |
| 4  | 3       | /dashboard    | click      | {"element": "chart"} | 192.168.1.3 | 2023-10-04 13:00:00   | 2023-10-04 13:00:00  | 2023-10-04 13:00:00  |

## 備考
- 定期的な集計・分析により、UI改善やユーザー行動分析の基盤として活用してください.

## 関係テーブル
- `user`: 操作実行者の情報を参照します。
