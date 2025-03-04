# システム設定テーブル設計書

## 概要
システム全体に影響する設定値を管理するテーブルです。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `system_setting`

| カラム名      | データ型      | 制約                                      | 説明                                  |
|---------------|---------------|-------------------------------------------|---------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | 設定の一意な識別子                     |
| setting_key   | VARCHAR(100)  | NOT NULL, UNIQUE                          | 設定キー（例: site_name, maintenance_mode）|
| setting_value | VARCHAR(255)  | NOT NULL                                  | 設定値                                |
| description   | TEXT          | DEFAULT NULL                              | 設定の詳細説明                        |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                      |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時    |

## 備考
- 設定はシステムの動作や表示に利用され、管理画面などから変更可能とする設計を検討してください。
- 各設定値はキャッシュの活用や更新履歴のログ記録を行うことで、システム全体の安定運用に寄与します.
- 設定更新時のキャッシュ無効化や履歴管理の仕組みを実装することを推奨します.

## 解決策
- 設定更新時にキャッシュ無効化処理を実装し、即時反映を確保する。
- 履歴テーブルを用いて過去の設定変更内容をトラッキングする仕組みを検討する。

## 固定設定値一覧
- setting_key: site_name, maintenance_mode など

## サンプルデータ

| id | setting_key      | setting_value | description              | created_at           | updated_at           |
|----|------------------|---------------|--------------------------|----------------------|----------------------|
| 1  | site_name        | FluMinGo      | サイト名                 | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | maintenance_mode | off           | 通常運用状態             | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | support_email    | support@x.com | サポート連絡先          | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | currency         | JPY           | 通貨設定                | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | timezone         | Asia/Tokyo    | タイムゾーン設定         | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | language         | ja            | デフォルト言語設定       | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
