# 関数実行プロファイリングログテーブル設計書

## 概要
フロントエンド・バックエンド双方での特定関数の実行時間やパフォーマンスデータを記録し、
処理時間の分析やボトルネック特定に役立てるテーブルです。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `function_execution_log`

| カラム名          | データ型       | 制約                                      | 説明                                       |
|-------------------|----------------|-------------------------------------------|--------------------------------------------|
| id                | INT            | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                           |
| function_name     | VARCHAR(100)   | NOT NULL                                  | 対象関数の名称                              |
| module            | VARCHAR(100)   | DEFAULT NULL                              | 関数が属するモジュールまたはコンポーネント     |
| execution_time_ms | DECIMAL(10,3)  | NOT NULL                                  | 関数の実行時間（ミリ秒単位）                  |
| input_parameters  | TEXT           | DEFAULT NULL                              | 入力パラメータ（JSON形式推奨）               |
| output_summary    | TEXT           | DEFAULT NULL                              | 出力結果の概要                             |
| executed_by       | INT            | DEFAULT NULL                              | 実行者のユーザーID（`user` テーブル参照、該当する場合） |
| occurred_at       | DATETIME       | NOT NULL                                  | 関数実行開始日時                           |
| created_at        | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                           |
| updated_at        | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時           |

## 備考
- 定期的な集計や分析により、最適化の必要な関数を特定してください.
