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
