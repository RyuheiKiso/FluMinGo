# 依存ライブラリ更新履歴テーブル設計書

## 概要
プロジェクトで利用する依存ライブラリの更新内容を記録し、更新理由や担当者情報を管理します。  
フロントエンド／バックエンド双方におけるライブラリ更新状況の把握やトラブルシュートに利用可能です。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `dependency_update_log`

| カラム名         | データ型      | 制約                                      | 説明                                       |
|------------------|---------------|-------------------------------------------|--------------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT               | 更新履歴の一意な識別子                        |
| dependency_name  | VARCHAR(100)  | NOT NULL                                  | 更新対象の依存ライブラリ名                     |
| old_version      | VARCHAR(50)   | NOT NULL                                  | 更新前のバージョン                           |
| new_version      | VARCHAR(50)   | NOT NULL                                  | 更新後のバージョン                           |
| update_reason    | TEXT          | DEFAULT NULL                              | 更新理由、備考                              |
| updated_by       | INT           | NOT NULL                                  | 更新を実施したユーザーの識別子（`user` テーブル参照） |
| update_date      | DATETIME      | NOT NULL                                  | 実際の更新実施日時                           |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                           |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時               |

## 備考
- 依存ライブラリの更新履歴を管理することで、トラブルの発生時に更新内容の把握やロールバックの検討がしやすくなります.

## サンプルデータ
| id | dependency_name | old_version | new_version | updated_by | update_date          | created_at           |
|----|-----------------|-------------|-------------|------------|----------------------|----------------------|
| 1  | libraryX        | 1.0.0       | 1.1.0       | 10         | 2023-10-01 13:00:00  | 2023-10-01 13:00:00  |
