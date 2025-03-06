# 分散トレースログテーブル設計書

## 概要
各サービス間で伝播する分散トレーシング情報（trace_id、span_id、親 span_id、実行時間、タグ等）を記録し、
システム全体のリクエストフローやパフォーマンス解析、ボトルネック特定に役立てます。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `distributed_trace_log`

| カラム名        | データ型      | 制約                                      | 説明                                          |
|-----------------|---------------|-------------------------------------------|-----------------------------------------------|
| id              | INT           | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                             |
| trace_id        | VARCHAR(100)  | NOT NULL                                  | リクエスト全体を識別するトレースID               |
| span_id         | VARCHAR(100)  | NOT NULL                                  | 個々の処理単位を識別するスパンID                 |
| parent_span_id  | VARCHAR(100)  | DEFAULT NULL                              | 親スパンのID（最上位の場合はNULL）              |
| service_name    | VARCHAR(100)  | NOT NULL                                  | 対象のサービス名またはモジュール名               |
| operation       | VARCHAR(100)  | NOT NULL                                  | 実行処理または操作名                           |
| start_time      | DATETIME      | NOT NULL                                  | 処理開始時刻                                  |
| end_time        | DATETIME      | DEFAULT NULL                              | 処理終了時刻（未完了の場合はNULL）              |
| duration_ms     | DECIMAL(10,3) | DEFAULT NULL                              | 実行時間（ミリ秒単位）                         |
| tags            | TEXT          | DEFAULT NULL                              | 補足情報（JSON形式推奨）                       |
| logs            | TEXT          | DEFAULT NULL                              | 追跡用ログ情報                                |
| created_at      | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                              |
| updated_at      | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時           |

## サンプルデータ
| id | trace_id         | span_id  | service_name   | operation   | start_time           | end_time             | created_at           |
|----|------------------|----------|----------------|-------------|----------------------|----------------------|----------------------|
| 1  | trace_abc123     | span_1   | OrderService   | processOrder| 2023-10-01 11:00:00  | 2023-10-01 11:05:00  | 2023-10-01 11:00:00  |

## 備考
- 分散トレーシングシステム（例: OpenTelemetry など）と連携し、自動でデータを記録する仕組みを検討してください.

## 関係テーブル
- `user`: トレース情報の実行者情報を参照する場合があります。
