# システム設定変更履歴テーブル設計書

## 概要
システム設定の変更履歴を記録し、いつ・誰がどの設定値をどのような理由で変更したかを追跡します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `system_setting_history`

| カラム名       | データ型      | 制約                                      | 説明                                    |
|----------------|---------------|-------------------------------------------|-----------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT               | 履歴ログの一意な識別子                    |
| setting_key    | VARCHAR(100)  | NOT NULL                                  | 対象となる設定キー                        |
| old_value      | VARCHAR(255)  | DEFAULT NULL                              | 変更前の設定値                           |
| new_value      | VARCHAR(255)  | NOT NULL                                  | 変更後の設定値                           |
| changed_by     | INT           | NOT NULL                                  | 設定変更を実施したユーザーの識別子 (`user.id`) |
| change_reason  | TEXT          | DEFAULT NULL                              | 変更理由                                |
| changed_at     | DATETIME      | NOT NULL                                  | 設定変更が実施された日時                   |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                         |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## 備考
- `changed_by` は `user` テーブルの主キーへの外部キーとして設定してください.
