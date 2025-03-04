# サービス状況管理テーブル設計書

## 概要
外部サービスや依存システムの稼働状況を記録・監視するためのテーブルです。

## テーブル種類
- トランザクション系

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

## 固定値一覧
- status: UP, DOWN, UNKNOWN
- service_name: payment_gateway など

## サンプルデータ

| id | service_name     | status  | last_checked         | details      | created_at           | updated_at           |
|----|------------------|---------|----------------------|--------------|----------------------|----------------------|
| 1  | payment_gateway  | UP      | 2023-10-01 12:00:00  | 正常稼働     | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | email_service    | DOWN    | 2023-11-05 12:00:00  | メンテナンス中 | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | analytics_tool   | UP      | 2023-12-01 12:00:00  | 正常稼働     | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | notification_service | UP  | 2023-12-15 12:00:00  | 正常稼働     | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | sms_service      | DOWN    | 2023-12-20 12:00:00  | メンテナンス中 | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | chat_service     | UP      | 2023-12-25 12:00:00  | 正常稼働     | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
| 7  | Auth Service     | UP      | 2023-10-01 09:00:00  | 2023-10-01 09:00:00  |
