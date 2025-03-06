# UIコンポーネント設定マスタテーブル設計書

## 概要
本テーブルは、各種UIコンポーネントや機能オプションの初期設定値、表示設定、定型値等を一元管理し、  
フロントエンド・バックエンド双方で動的に参照・上書きできるようにするためのマスタです。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `component_config_master`

| カラム名         | データ型      | 制約                                     | 説明                                      |
|------------------|---------------|------------------------------------------|-------------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT              | 一意な識別子                              |
| component_name   | VARCHAR(100)  | NOT NULL                                 | コンポーネント名（例: header, sidebar）    |
| config_key       | VARCHAR(100)  | NOT NULL                                 | 設定キーまたはパラメータ名                 |
| config_value     | TEXT          | NOT NULL                                 | 設定される値または初期値                   |
| note             | TEXT          | DEFAULT NULL                             | 補足説明・備考                           |
| is_active        | BOOLEAN       | NOT NULL, DEFAULT TRUE                   | 有効状態                                  |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP      | レコード作成日時                         |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## 備考
- `component_name` と `config_key` の組み合わせで一意性を検討してください。
- 各種UIコンポーネントや機能オプションの初期設定値を柔軟に管理するための基盤としてご利用ください.

## 関係テーブル
- `user_preferences`: ユーザー設定の参照データとして利用される場合があります。

## サンプルデータ
| id | component_name | config_key | config_value | note       | is_active | created_at           | updated_at           |
|----|----------------|------------|--------------|------------|-----------|----------------------|----------------------|
| 1  | header         | theme      | dark         | NULL       | TRUE      | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | sidebar        | position   | left         | NULL       | TRUE      | 2023-11-01 00:00:00  | 2023-11-01 00:00:00  |
| 3  | footer         | visibility | visible      | NULL       | TRUE      | 2024-01-01 00:00:00  | 2024-01-01 00:00:00  |
| 4  | navbar         | style      | compact      | NULL       | TRUE      | 2024-01-15 00:00:00  | 2024-01-15 00:00:00  |
| 5  | button         | color      | blue         | NULL       | TRUE      | 2024-02-01 00:00:00  | 2024-02-01 00:00:00  |