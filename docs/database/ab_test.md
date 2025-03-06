# A/Bテスト管理テーブル設計書

## 概要
新機能の効果検証やユーザー反応を測定するためのA/Bテスト設定と結果を管理します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `ab_test`

| カラム名         | データ型      | 制約                                     | 説明                                          |
|------------------|---------------|------------------------------------------|-----------------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT              | テストの一意な識別子                           |
| test_name        | VARCHAR(100)  | NOT NULL, UNIQUE                         | テスト名（例: new_feature_test）              |
| description      | TEXT          | DEFAULT NULL                             | テスト概要・目的                              |
| start_date       | DATETIME      | NOT NULL                                 | テスト開始日時                                |
| end_date         | DATETIME      | DEFAULT NULL                             | テスト終了日時（終了時NULLの場合は継続中）       |
| variant_options  | TEXT          | NOT NULL                                 | 各グループの設定（JSON形式推奨）              |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP      | レコード作成日時                              |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時           |

## 備考
- variant_optionsには各バリアントの比率や条件をJSONで記録することを推奨します.

## 関係テーブル
- `user`: A/Bテストの対象ユーザー情報を参照する場合があります。
- `ab_test_result`: A/Bテストの結果情報を管理します。

## サンプルデータ
| id | test_name         | description       | start_date          | end_date            | variant_options       | created_at           | updated_at           |
|----|-------------------|-------------------|---------------------|---------------------|-----------------------|----------------------|----------------------|
| 1  | new_feature_test  | 新機能のテスト    | 2023-10-01 00:00:00 | 2023-10-15 00:00:00 | {"A": 50, "B": 50}    | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | ui_change_test    | UI変更のテスト    | 2023-11-01 00:00:00 | NULL                | {"control": 70, "test": 30} | 2023-11-01 00:00:00  | 2023-11-01 00:00:00  |
| 3  | pricing_test      | 価格変更のテスト  | 2023-12-01 00:00:00 | 2023-12-15 00:00:00 | {"original": 50, "discount": 50} | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | layout_test       | レイアウト変更のテスト | 2024-01-01 00:00:00 | 2024-01-15 00:00:00 | {"old_layout": 50, "new_layout": 50} | 2024-01-01 00:00:00  | 2024-01-01 00:00:00  |
