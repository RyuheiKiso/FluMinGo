# デフォルトパラメータマスタテーブル設計書

## 概要
システム全体で利用するデフォルト値や初期設定値を一元管理します。  
フロントエンド・バックエンド双方で、動作や表示の初期値設定、オーバーライド用情報として活用できます。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `default_parameter_master`

| カラム名         | データ型      | 制約                                      | 説明                                    |
|------------------|---------------|-------------------------------------------|-----------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT               | 一意な識別子                            |
| parameter_group  | VARCHAR(100)  | NOT NULL                                  | 設定の分類（例: display, system, feature）|
| parameter_key    | VARCHAR(100)  | NOT NULL                                  | 設定キーまたはコード                     |
| parameter_value  | TEXT          | NOT NULL                                  | デフォルト値または初期設定値              |
| description      | TEXT          | DEFAULT NULL                              | 詳細説明                                |
| is_active        | BOOLEAN       | NOT NULL, DEFAULT TRUE                    | 有効状態                                |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                        |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## 備考
- parameter_group と parameter_key の組み合わせで一意性を検討してください。
- 各種動作や表示の初期設定値を管理し、後からの上書きや変更が容易になります.

## サンプルデータ
| id | parameter_group | parameter_key    | parameter_value | created_at           | updated_at           |
|----|-----------------|------------------|-----------------|----------------------|----------------------|
| 1  | display         | max_items        | 20              | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
