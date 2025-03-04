# ダイナミックマスタテーブル設計書

## 概要
本テーブルは、システム内で動的に管理する必要がある各種定型データ（例えば、UI設定、機能オプション、カスタム属性など）を一元管理します。  
フロントエンド・バックエンド双方で、各種ドメイン毎の属性情報の参照や変更にご活用ください。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `dynamic_master`

| カラム名       | データ型      | 制約                                             | 説明                                              |
|----------------|---------------|--------------------------------------------------|---------------------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT                      | 一意な識別子                                        |
| domain         | VARCHAR(100)  | NOT NULL                                         | 対象ドメイン（例: ui_setting, feature_option, custom） |
| attribute_key  | VARCHAR(100)  | NOT NULL                                         | 属性キーまたはコード                                |
| attribute_value| TEXT          | NOT NULL                                         | 属性値または内容                                   |
| extra_info     | TEXT          | DEFAULT NULL                                     | 補足情報（JSON形式推奨）                            |
| is_active      | BOOLEAN       | NOT NULL, DEFAULT TRUE                           | 有効状態                                           |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP              | レコード作成日時                                  |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時              |

## サンプルデータ
| id | domain      | attribute_key | attribute_value       | is_active | created_at           | updated_at           |
|----|-------------|---------------|-----------------------|-----------|----------------------|----------------------|
| 1  | ui_setting  | theme_color   | blue                  | TRUE      | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |

## 備考
- `domain` と `attribute_key` の組み合わせで一意性を検討してください。
- 各種動的設定やカスタム属性を柔軟に管理するための基盤としてご利用ください.
