# サービス状況管理テーブル設計書

## 概要
外部サービスや依存システムの稼働状況を記録・監視するためのテーブルです。

## テーブル定義
- テーブル名: `service_status`

| カラム名      | データ型      | 制約                                      | 説明                                      |
|---------------|---------------|-------------------------------------------|-------------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | サービス状況の一意な識別子                     |
| service_name  | VARCHAR(100)  | NOT NULL, UNIQUE                          | サービス名（例: payment_gateway）          |
| status        | VARCHAR(50)   | NOT NULL                                  | サービスの状態（例: UP, DOWN, UNKNOWN）    |
| last_checked  | DATETIME      | NOT NULL                                  | 最終チェック日時                           |
| details       | TEXT          | DEFAULT NULL                              | サービス状態の詳細情報                        |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                           |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                  |

## 備考
- サービス監視により、異常検知時に迅速な対応が可能となります。
- 稼働状況の自動収集や通知システムとの連携を検討してください。

## 解決策
- 定期的なチェック処理により、`last_checked` および `status` を更新する仕組みを実装してください。
- 状態異常時には、詳細情報 (`details`) にエラー情報等を記録し、通知処理を連携することを推奨します.
