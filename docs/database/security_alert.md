# セキュリティアラートテーブル設計書

## 概要
システムのセキュリティ関連イベント（例: 不正アクセス、マルウェア検知等）を記録し、対応状況を管理します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `security_alert`

| カラム名    | データ型     | 制約                                                   | 説明                                          |
|-------------|--------------|--------------------------------------------------------|-----------------------------------------------|
| id          | INT          | PRIMARY KEY, AUTO_INCREMENT                            | アラートの一意な識別子                          |
| alert_type  | VARCHAR(50)  | NOT NULL                                               | アラートの種類（例: intrusion, malware）       |
| description | TEXT         | NOT NULL                                               | アラートの詳細説明                             |
| severity    | VARCHAR(20)  | NOT NULL, DEFAULT 'low'                                | 重大度（low, medium, high）                    |
| detected_at | DATETIME     | NOT NULL                                               | アラート検知日時                               |
| resolved    | BOOLEAN      | NOT NULL, DEFAULT FALSE                                | 解決済みかどうか                               |
| resolved_at | DATETIME     | DEFAULT NULL                                           | 解決日時（解決済みの場合のみ）                 |
| created_at  | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP                    | レコード作成日時                              |
| updated_at  | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## サンプルデータ
| id | alert_type | description          | severity | detected_at         | resolved | resolved_at         | created_at           | updated_at           |
|----|------------|----------------------|----------|---------------------|----------|---------------------|----------------------|----------------------|
| 1  | intrusion  | 不審なログイン試行検出 | high     | 2023-10-01 11:00:00 | FALSE    | NULL                | 2023-10-01 11:00:00 | 2023-10-01 11:00:00  |

## 備考
- 迅速なセキュリティ対応のため、リアルタイムモニタリングや他システムとの連携を検討してください.

## 関係テーブル
- `user`: アラートの対象ユーザー情報を参照する場合があります。
