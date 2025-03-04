# システム設定テーブル設計書

## 概要
システム全体に影響する設定値を管理するテーブルです。

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
