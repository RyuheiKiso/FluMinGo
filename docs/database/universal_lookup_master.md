# ユニバーサル参照マスタテーブル設計書

## 概要
本テーブルは、国コード、通貨、ステータス、カスタムオプションなど、システム全体で利用する汎用的な参照データを管理します。
フロントエンド・バックエンド双方で動的な表示設定や業務ロジックの参照にご活用ください。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `universal_lookup_master`

| カラム名         | データ型      | 制約                                    | 説明                                   |
|------------------|---------------|-----------------------------------------|----------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT             | 一意な識別子                           |
| lookup_category  | VARCHAR(100)  | NOT NULL                                | データの分類（例: country, currency, status, custom） |
| lookup_key       | VARCHAR(100)  | NOT NULL                                | 参照用キーまたはコード                |
| lookup_value     | VARCHAR(255)  | NOT NULL                                | 表示値または名称                        |
| metadata         | TEXT          | DEFAULT NULL                            | 補足情報（JSON形式推奨）              |
| is_active        | BOOLEAN       | NOT NULL, DEFAULT TRUE                  | 有効状態                               |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP      | レコード作成日時                       |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時 |

## 備考
- lookup_category と lookup_key の組み合わせで一意性を検討してください。
- 汎用データの一元管理により、設定変更や参照更新が柔軟に行えます.
