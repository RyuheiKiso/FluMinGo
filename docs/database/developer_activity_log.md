# 開発者アクティビティログテーブル設計書

## 概要
開発者が実施した操作（例: 設定更新、デバッグセッション開始/終了、緊急対応操作等）を記録します。  
フロントエンド／バックエンド双方の作業履歴として、原因追跡や運用改善に役立ちます。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `developer_activity_log`

| カラム名         | データ型      | 制約                                      | 説明                                    |
|------------------|---------------|-------------------------------------------|-----------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                        |
| developer_id     | INT           | NOT NULL                                  | 操作実施者の識別子（`user` テーブル参照）   |
| activity_type    | VARCHAR(50)   | NOT NULL                                  | 操作種別（例: CONFIG_UPDATE, DEBUG_START, DEBUG_END など）|
| target_resource  | VARCHAR(100)  | DEFAULT NULL                              | 対象リソース（例: system_setting, api_key 等）|
| description      | TEXT          | DEFAULT NULL                              | 操作の詳細または理由                     |
| ip_address       | VARCHAR(45)   | DEFAULT NULL                              | 操作時のIPアドレス                        |
| occurred_at      | DATETIME      | NOT NULL                                  | 操作発生日時                           |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                        |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## サンプルデータ
| id | developer_id | activity_type   | target_resource | description | occurred_at          | created_at           |
|----|--------------|-----------------|-----------------|-------------|----------------------|----------------------|
| 1  | 10           | CONFIG_UPDATE   | system_setting  | NULL        | 2023-10-01 12:00:00  | 2023-10-01 12:00:00  |

## 備考
- `developer_id`は`user`テーブルの主キーへの外部キーとして設定してください。
- 緊急対応やデバッグ作業など、運用時の重要イベントの記録により、後から原因を追跡可能にします.
