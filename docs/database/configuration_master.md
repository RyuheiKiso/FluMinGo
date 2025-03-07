# 設定マスタ統合設計書

## 概要
本テーブルは、これまで分散して管理されていた汎用設定値（デフォルトパラメータ、グローバル設定、一般定数、動的設定など）を一元管理します。  
各設定は config_type で分類し、キー・値・説明などを共通スキーマで管理します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `configuration_master`

| カラム名      | データ型      | 制約                                     | 説明                                          |
|---------------|---------------|------------------------------------------|-----------------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT              | 一意な識別子                                   |
| config_type   | VARCHAR(50)   | NOT NULL                                 | 設定種別（例: default_parameter, global_config, generic_data, application_constant, common_config, dynamic_config） |
| config_key    | VARCHAR(100)  | NOT NULL                                 | 設定キー、パラメータ、またはコード              |
| config_value  | TEXT          | NOT NULL                                 | 設定値または定数値                              |
| description   | TEXT          | DEFAULT NULL                             | 詳細説明                                      |
| is_active     | BOOLEAN       | NOT NULL, DEFAULT TRUE                   | 有効状態                                      |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                              |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時           |

## 備考
- 古い各マスタテーブルは本テーブルへ統合済みです.
- 各種設定の追加や更新は config_type ごとに管理してください.

## サンプルデータ
| id | config_type       | config_key       | config_value | description                           | is_active | created_at           | updated_at           |
|----|-------------------|------------------|--------------|---------------------------------------|-----------|----------------------|----------------------|
| 1  | default_parameter | max_users        | 100          | 最大ユーザー数                        | TRUE      | 2023-09-01 00:00:00  | 2023-09-01 00:00:00  |
| 2  | global_config     | enable_feature   | true         | フィーチャー有効化                     | TRUE      | 2023-09-15 00:00:00  | 2023-09-15 00:00:00  |
| 3  | generic_data      | welcome_message  | Welcome!     | デフォルトウェルカムメッセージ          | TRUE      | 2023-10-10 00:00:00  | 2023-10-10 00:00:00  |
| 4  | dynamic_config    | refresh_interval | 300          | 画面更新間隔（秒）                     | TRUE      | 2023-10-10 00:00:00  | 2023-10-10 00:00:00  |
