# Webhookサブスクリプション管理テーブル設計書

## 概要
外部システム向けにWebhook通知のサブスクリプション情報を管理します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `webhook_subscription`

| カラム名      | データ型      | 制約                                     | 説明                                           |
|---------------|---------------|------------------------------------------|------------------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT              | サブスクリプションの一意な識別子                     |
| user_id       | INT           | DEFAULT NULL                             | 登録ユーザーの識別子（`user` テーブル参照、任意）       |
| url           | VARCHAR(255)  | NOT NULL, UNIQUE                         | WebhookエンドポイントURL                          |
| event_type    | VARCHAR(100)  | NOT NULL                                 | 対象イベント（例: order.created, user.updated 等）    |
| secret        | VARCHAR(255)  | DEFAULT NULL                             | 通知用認証シークレット（必要に応じて設定）            |
| is_active     | BOOLEAN       | NOT NULL, DEFAULT TRUE                   | サブスクリプションの有効状態                         |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                                |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                    |

## 備考
- サブスクリプション登録後、イベント発生時にWebhook通知を実施する仕組みと連携してください。
- 有効状態や重複登録防止のため、適切なバリデーションを実装することを推奨します.

## 関係テーブル
- `user`: Webhookサブスクリプションの所有者情報を参照します。

## サンプルデータ
| id | user_id | url                                  | event_type    | secret | is_active | created_at           | updated_at           |
|----|---------|--------------------------------------|---------------|--------|-----------|----------------------|----------------------|
| 1  | 101     | https://example.com/webhook          | order.created | abc123 | TRUE      | 2023-10-01 12:00:00  | 2023-10-01 12:00:00  |
