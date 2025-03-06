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

## 関係テーブル
- `user_preferences`: ユーザー設定の参照データとして利用される場合があります。
- `system_setting`: システム設定の参照データとして利用される場合があります。
- `lookup_history`: 参照データの変更履歴を管理します。

## サンプルデータ
| id | lookup_category | lookup_key   | lookup_value | is_active | created_at           | updated_at           |
|----|-----------------|--------------|--------------|-----------|----------------------|----------------------|
| 1  | country         | country_code | Japan        | TRUE      | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | currency        | currency_code| JPY          | TRUE      | 2023-10-02 00:00:00  | 2023-10-02 00:00:00  |
| 3  | status          | active       | Active       | TRUE      | 2023-10-03 00:00:00  | 2023-10-03 00:00:00  |
| 4  | status          | inactive     | Inactive     | TRUE      | 2023-10-04 00:00:00  | 2023-10-04 00:00:00  |
