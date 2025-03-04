# アプリケーションメトリクステーブル設計書

## 概要
システムのパフォーマンス情報や利用状況を記録し、健康状態の監視や運用最適化に役立ます。

## テーブル定義
- テーブル名: `app_metrics`

| カラム名     | データ型     | 制約                              | 説明                                     |
|--------------|--------------|-----------------------------------|------------------------------------------|
| id           | INT          | PRIMARY KEY, AUTO_INCREMENT       | メトリクスの一意な識別子                  |
| metric_name  | VARCHAR(100) | NOT NULL                          | メトリクス名（例: active_users）         |
| metric_value | DECIMAL(10,2)| NOT NULL                          | メトリクスの数値                          |
| recorded_at  | DATETIME     | NOT NULL                          | 指標が記録された日時                       |
| created_at   | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP | レコード作成日時                       |
| updated_at   | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時 |

## 備考
- 指標は定期バッチやリアルタイム監視システムで更新します.
