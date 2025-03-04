# サーバーリソース使用状況ログテーブル設計書

## 概要
サーバーのCPU使用率、メモリ使用率、ディスク使用量、ネットワークトラフィック等を定期的に記録し、
システムパフォーマンスの監視および改善に役立てるためのテーブルです。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `server_resource_log`

| カラム名         | データ型       | 制約                                      | 説明                                          |
|------------------|----------------|-------------------------------------------|-----------------------------------------------|
| id               | INT            | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                             |
| server_name      | VARCHAR(100)   | NOT NULL                                  | サーバー名またはホスト名                        |
| cpu_usage        | DECIMAL(5,2)   | NOT NULL                                  | CPU使用率（例: 75.50）                         |
| memory_usage     | DECIMAL(5,2)   | NOT NULL                                  | メモリ使用率（例: 65.30）                        |
| disk_usage       | DECIMAL(5,2)   | NOT NULL                                  | ディスク使用量（パーセンテージ）                  |
| network_in       | DECIMAL(10,2)  | DEFAULT NULL                              | ネットワーク受信量（MB単位、例: 123.45）          |
| network_out      | DECIMAL(10,2)  | DEFAULT NULL                              | ネットワーク送信量（MB単位、例: 67.89）           |
| log_timestamp    | DATETIME       | NOT NULL                                  | 記録時刻                                      |
| created_at       | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                             |
| updated_at       | DATETIME       | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                |

## サンプルデータ
| id | server_name | cpu_usage | memory_usage | disk_usage | network_in | network_out | log_timestamp       | created_at           | updated_at           |
|----|-------------|-----------|--------------|------------|------------|-------------|---------------------|----------------------|----------------------|
| 1  | server1     | 75.3      | 65.5         | 80.2       | 123.45     | 67.89       | 2023-10-01 10:00:00 | 2023-10-01 10:00:00 | 2023-10-01 10:00:00 |

## 備考
- 定期バッチや監視システムと連携し、定期的なデータ取得・登録を行ってください.
- 長期間の保存時は、パーティション管理や集計テーブルとの連携を検討してください.
