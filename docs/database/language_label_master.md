# 多言語ラベルマスタテーブル設計書

## 概要
UIの表示文言やエラーメッセージ等、各種多言語対応コンテンツを一元管理します。  
フロントエンド・バックエンド双方で、共通のラベル情報として利用してください。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `language_label_master`

| カラム名      | データ型      | 制約                                     | 説明                                    |
|---------------|---------------|------------------------------------------|-----------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT              | ラベルの一意な識別子                      |
| language_code | VARCHAR(10)   | NOT NULL                                 | 言語コード（例: ja, en, fr）              |
| label_key     | VARCHAR(100)  | NOT NULL                                 | ラベルキー（例: welcome_message）       |
| label_value   | TEXT          | NOT NULL                                 | 表示文言または内容                      |
| description   | TEXT          | DEFAULT NULL                             | 補足説明、使用例等                        |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## 備考
- 同一言語内で label_key の一意性を確保するため、必要に応じた複合ユニーク制約を検討してください.
- 新たなラベルの追加や内容更新は管理画面経由で実施する設計を推奨します.

## 関係テーブル
- `user_preferences`: ユーザー設定の表示文言として利用される場合があります。

## サンプルデータ
| id | language_code | label_key         | label_value         | created_at           | updated_at           |
|----|---------------|-------------------|---------------------|----------------------|----------------------|
| 1  | ja            | welcome_message   | ようこそ！          | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | en            | welcome_message   | Welcome!            | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 3  | fr            | welcome_message   | Bienvenue!          | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
