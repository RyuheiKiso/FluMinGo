# スロークエリログテーブル設計書

## 概要
実行時間が長いクエリ（スロークエリ）の詳細を記録し、バックエンドのパフォーマンス改善に役立てるテーブルです。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `slow_query_log`

| カラム名       | データ型       | 制約                                      | 説明                                      |
|----------------|----------------|-------------------------------------------|-------------------------------------------|
| id             | INT            | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                         |
| query_text     | TEXT           | NOT NULL                                  | 実行されたクエリ文                         |
| execution_time | DECIMAL(10,3)  | NOT NULL                                  | クエリの実行時間（ミリ秒単位）              |
| rows_examined  | INT            | DEFAULT NULL                              | クエリ実行時に検査された行数                |
| rows_sent      | INT            | DEFAULT NULL                              | クエリ実行時に返された行数                  |
| db_name        | VARCHAR(100)   | DEFAULT NULL                              | 対象データベース名                         |
| query_date     | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | クエリ実行日時                            |
| created_at     | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                          |

## サンプルデータ
| id | query_text           | execution_time_ms | executed_at          | created_at           |
|----|----------------------|-------------------|----------------------|----------------------|
| 1  | SELECT * FROM orders | 1200              | 2023-10-01 12:00:00  | 2023-10-01 12:00:00  |

## 備考
- 定期的に集計・分析を実施し、パフォーマンスのボトルネック特定にご活用ください.

## 関係テーブル
- `database`: スロークエリが実行されたデータベース情報を参照する場合があります。
