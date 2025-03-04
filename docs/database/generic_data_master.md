# 汎用データマスタテーブル設計書

## 概要
システム全体で利用する様々な汎用データ（設定値、選択肢、定型文など）を一元管理します。  
フロントエンドおよびバックエンドで共通の参照情報として活用できます。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `generic_data_master`

| カラム名    | データ型      | 制約                                             | 説明                                      |
|-------------|---------------|--------------------------------------------------|-------------------------------------------|
| id          | INT           | PRIMARY KEY, AUTO_INCREMENT                      | マスタデータの一意な識別子                    |
| category    | VARCHAR(100)  | NOT NULL                                         | データの分類（例: config, option, default）  |
| data_key    | VARCHAR(100)  | NOT NULL                                         | データのキーまたはコード                    |
| data_value  | TEXT          | NOT NULL                                         | 登録する値または内容                        |
| metadata    | TEXT          | DEFAULT NULL                                     | 補足情報（JSON形式推奨）                     |
| description | TEXT          | DEFAULT NULL                                     | 詳細説明                                  |
| is_active   | BOOLEAN       | NOT NULL, DEFAULT TRUE                           | エントリが有効かどうかの状態              |
| created_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP              | レコード作成日時                           |
| updated_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## 備考
- category と data_key の組み合わせで一意性を検討してください。
- 多様なシステム設定やオプション、定型文情報の管理にご活用ください.

## サンプルデータ
| id | category | data_key  | data_value        | created_at           | updated_at           |
|----|----------|-----------|-------------------|----------------------|----------------------|
| 1  | option   | currency  | USD               | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
