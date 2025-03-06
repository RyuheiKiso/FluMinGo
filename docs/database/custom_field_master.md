# カスタム項目マスタテーブル設計書

## 概要
アプリケーション内の各エンティティ（例: user, product, project等）に対して、  
動的に追加されるカスタム項目の定義を管理するテーブルです。  
フロントエンドおよびバックエンドで柔軟なデータ拡張が可能になります。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `custom_field_master`

| カラム名         | データ型      | 制約                                             | 説明                                         |
|------------------|---------------|--------------------------------------------------|----------------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT                      | 一意な識別子                                 |
| entity_name      | VARCHAR(100)  | NOT NULL                                         | 対象エンティティ名（例: user, product）       |
| field_key        | VARCHAR(100)  | NOT NULL                                         | カスタム項目のキーまたはコード                |
| field_label      | VARCHAR(255)  | NOT NULL                                         | 表示用項目名                                  |
| field_type       | VARCHAR(50)   | NOT NULL                                         | データ型（例: text, number, date, boolean）    |
| default_value    | TEXT          | DEFAULT NULL                                     | 初期値またはデフォルト値                        |
| validation_rules | TEXT          | DEFAULT NULL                                     | 入力検証ルール（JSON形式推奨）                 |
| is_active        | BOOLEAN       | NOT NULL, DEFAULT TRUE                           | 有効状態                                     |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP              | レコード作成日時                             |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時              |

## 備考
- `entity_name` と `field_key` の組み合わせで一意性を検討してください。
- 各種エンティティに対してカスタム項目による拡張が柔軟に行える基盤として活用してください.

## 関係テーブル
- `user`: カスタム項目の対象エンティティとして利用される場合があります。

## サンプルデータ
| id | entity_name | field_key | field_label | field_type | default_value | validation_rules | is_active | created_at           | updated_at           |
|----|-------------|-----------|-------------|------------|---------------|------------------|-----------|----------------------|----------------------|
| 1  | user        | age       | 年齢        | number     | NULL          | {"min": 0}       | TRUE      | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | product     | color     | 色          | text       | "red"         | {"required": true}| TRUE      | 2023-11-01 00:00:00  | 2023-11-01 00:00:00  |
