# 汎用マスタテーブル設計書

## 概要
システム全体で共通して使用する定型データや参照情報を管理するためのテーブルです。  
フロントエンドおよびバックエンドで利用可能な、カテゴリー別のマスタデータとして活用します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `common_master`

| カラム名    | データ型      | 制約                                     | 説明                                    |
|-------------|---------------|------------------------------------------|-----------------------------------------|
| id          | INT           | PRIMARY KEY, AUTO_INCREMENT              | マスタデータの一意な識別子                    |
| category    | VARCHAR(100)  | NOT NULL                                 | データ分類（例: country, currency, status） |
| code        | VARCHAR(50)   | NOT NULL                                 | データコードまたはキー                      |
| name        | VARCHAR(255)  | NOT NULL                                 | 表示名称または値                           |
| value       | VARCHAR(255)  | DEFAULT NULL                             | 補足値（必要に応じて）                       |
| description | TEXT          | DEFAULT NULL                             | 詳細説明                                  |
| created_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP      | レコード作成日時                         |
| updated_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## 備考
- 各カテゴリごとに異なる定型データを管理でき、動的な参照が可能です。
- 新たなカテゴリやコードは管理画面等で追加・更新してください.

## 関係テーブル
- `user_preferences`: ユーザー設定の参照データとして利用される場合があります。

## サンプルデータ
| id | category | code   | name       | value | description | created_at           | updated_at           |
|----|----------|--------|------------|-------|-------------|----------------------|----------------------|
| 1  | country  | JP     | Japan      | NULL  | 日本         | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | currency | USD    | US Dollar  | NULL  | アメリカドル  | 2023-11-01 00:00:00  | 2023-11-01 00:00:00  |
