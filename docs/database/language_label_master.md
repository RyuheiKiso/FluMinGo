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
