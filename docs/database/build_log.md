# ビルドログテーブル設計書

## 概要
ビルド実行時の状況や結果、ログ情報を記録し、ビルドプロセスの監視や履歴管理に利用します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `build_log`

| カラム名      | データ型      | 制約                                      | 説明                                  |
|---------------|---------------|-------------------------------------------|---------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | ビルドログの一意な識別子               |
| build_number  | VARCHAR(50)   | NOT NULL                                  | ビルド番号または識別子（例: build_20231001） |
| branch        | VARCHAR(100)  | NOT NULL                                  | 対象ブランチ名                        |
| status        | VARCHAR(20)   | NOT NULL                                  | ビルド状態（success, failed, running 等） |
| triggered_by  | VARCHAR(100)  | DEFAULT NULL                              | ビルドをトリガーしたユーザーまたはシステム |
| started_at    | DATETIME      | NOT NULL                                  | ビルド開始日時                        |
| finished_at   | DATETIME      | DEFAULT NULL                              | ビルド終了日時（実行中はNULL）         |
| log           | TEXT          | DEFAULT NULL                              | ビルド時のログ情報                    |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                      |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時    |

## サンプルデータ

| id | build_number    | branch       | status  | triggered_by | started_at           | finished_at          | log           | created_at           | updated_at           |
|----|-----------------|--------------|---------|--------------|----------------------|----------------------|---------------|----------------------|----------------------|
| 1  | build_20231001  | main         | success | user1        | 2023-10-01 00:00:00  | 2023-10-01 01:00:00  | Build success | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | build_20231105  | feature-xyz  | failed  | user2        | 2023-11-05 00:00:00  | 2023-11-05 01:00:00  | Build failed  | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | build_20231201  | main         | running | user3        | 2023-12-01 00:00:00  | NULL                 | NULL          | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |

## 備考
- ビルドログはビルドの成功率や障害原因の特定に利用できます.
