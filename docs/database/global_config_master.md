# グローバル設定マスタテーブル設計書

## 概要
システム全体に影響する設定値や定型情報を一元管理するためのテーブルです。  
フロントエンドおよびバックエンドの動作制御、表示設定、動的コンテンツ管理に利用できます。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `global_config_master`

| カラム名     | データ型     | 制約                                      | 説明                                    |
|--------------|--------------|-------------------------------------------|-----------------------------------------|
| id           | INT          | PRIMARY KEY, AUTO_INCREMENT               | 設定情報の一意な識別子                    |
| config_group | VARCHAR(100) | NOT NULL                                  | 設定の分類（例: display, system, feature） |
| config_key   | VARCHAR(100) | NOT NULL                                  | 設定キーまたはコード                     |
| config_value | TEXT         | NOT NULL                                  | 設定値（JSON形式など可）                  |
| description  | TEXT         | DEFAULT NULL                              | 設定の詳細説明                         |
| is_active    | BOOLEAN      | NOT NULL, DEFAULT TRUE                    | 設定が有効かどうかの状態                |
| created_at   | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at   | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## 備考
- `config_group` と `config_key` の組み合わせで一意性を検討してください。
- 設定変更時はキャッシュ更新等、システム全体への反映を考慮してください.

## サンプルデータ
| id | config_group | config_key  | config_value             | created_at           | updated_at           |
|----|--------------|-------------|--------------------------|----------------------|----------------------|
| 1  | display      | theme       | {"mode": "light"}        | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
