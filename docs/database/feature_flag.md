# 機能フラグ管理テーブル設計書

## 概要
特定機能の有効/無効を動的に制御するためのフラグ情報を管理します。

## テーブル定義
- テーブル名: `feature_flag`

| カラム名      | データ型      | 制約                                      | 説明                                      |
|---------------|---------------|-------------------------------------------|-------------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | フラグの一意な識別子                         |
| feature_name  | VARCHAR(100)  | NOT NULL, UNIQUE                          | 機能名（例: new_dashboard）               |
| is_enabled    | BOOLEAN       | NOT NULL, DEFAULT FALSE                   | 機能の有効状態                              |
| description   | TEXT          | DEFAULT NULL                              | 機能の説明                                  |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                            |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時    |

## 備考
- フラグ管理により、リリース前や段階的な機能提供が容易になります。
