# CI/CDパイプライン管理テーブル設計書

## 概要
CI/CDパイプラインの実行状況や結果を管理し、パイプラインの状態やログを記録します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `ci_pipeline`

| カラム名      | データ型      | 制約                                      | 説明                                  |
|---------------|---------------|-------------------------------------------|---------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | パイプライン実行の一意な識別子          |
| pipeline_name | VARCHAR(100)  | NOT NULL                                  | パイプライン名（例: build_master）     |
| commit_hash   | VARCHAR(40)   | NOT NULL                                  | 対象のコミットハッシュ                |
| status        | VARCHAR(20)   | NOT NULL                                  | 実行状態（success, failed, running 等） |
| started_at    | DATETIME      | NOT NULL                                  | パイプライン開始日時                  |
| finished_at   | DATETIME      | DEFAULT NULL                              | パイプライン終了日時（実行中はNULL）    |
| log           | TEXT          | DEFAULT NULL                              | 実行ログ（エラー詳細等）                |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                      |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時    |

## 備考
- パイプライン実行時のログはトラブルシュートや運用監視に役立ちます.

## 関係テーブル
- `test_coverage_report`: テストカバレッジレポートの生成元パイプライン情報を参照します。
- `static_code_analysis_report`: 静的コード解析レポートの生成元パイプライン情報を参照します。
- `deployment_log`: デプロイメントの実行元パイプライン情報を参照します。

## サンプルデータ
| id | pipeline_name | commit_hash                        | status  | started_at           | finished_at          | log           | created_at           | updated_at           |
|----|---------------|------------------------------------|---------|----------------------|----------------------|---------------|----------------------|----------------------|
| 1  | build_master  | 1a2b3c4d5e6f7g8h9i0j               | success | 2023-10-01 00:00:00  | 2023-10-01 01:00:00  | Build success | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | build_feature | 0j9i8h7g6f5e4d3c2b1a               | failed  | 2023-11-05 00:00:00  | 2023-11-05 01:00:00  | Build failed  | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
