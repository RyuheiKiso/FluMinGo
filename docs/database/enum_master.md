# 列挙型マスタテーブル設計書

## 概要
システム全体で使用される固定の列挙型データ（例: status, priority, category など）を管理するためのテーブルです。  
フロントエンド／バックエンド双方で、一定の定型値を参照し、アプリケーションの整合性を保ちます。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `enum_master`

| カラム名    | データ型      | 制約                                     | 説明                                    |
|-------------|---------------|------------------------------------------|-----------------------------------------|
| id          | INT           | PRIMARY KEY, AUTO_INCREMENT              | マスタデータの一意な識別子                    |
| enum_type   | VARCHAR(100)  | NOT NULL                                 | 列挙型のカテゴリー（例: status, priority）    |
| enum_key    | VARCHAR(50)   | NOT NULL                                 | 列挙値のキーまたはコード                   |
| enum_value  | VARCHAR(255)  | NOT NULL                                 | 表示名または具体的な値                      |
| description | TEXT          | DEFAULT NULL                             | 列挙値の詳細説明                         |
| is_active   | BOOLEAN       | NOT NULL, DEFAULT TRUE                   | 有効状態                                  |
| created_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                         |
| updated_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## サンプルデータ
| id | enum_type | enum_key | enum_value | description | is_active | created_at           | updated_at           |
|----|-----------|----------|------------|-------------|-----------|----------------------|----------------------|
| 1  | status    | active   | Active     | 状態がアクティブ | TRUE      | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |

## 備考
- enum_type と enum_key の組み合わせで一意性を検討してください（必要に応じた複合ユニーク制約の導入を推奨）。
- フロントエンド・バックエンドで共通の選択肢管理や固定値の参照にご活用ください.

## 関係テーブル
- `user_preferences`: ユーザー設定の参照データとして利用される場合があります。
- `system_setting`: システム設定の参照データとして利用される場合があります。
