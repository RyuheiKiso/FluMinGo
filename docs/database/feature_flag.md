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
- フラグ管理により、リリース前や段階的な機能提供が容易になります.
- フラグ変更時のキャッシュ無効化や即時反映を実現する仕組みの検討を推奨します.
- フラグ変更時のキャッシュ無効化処理や即時反映機能の実装を検討すること.

## 解決策
- 機能フラグ変更時に、キャッシュ層の無効化を行い即時反映を実施する仕組みを導入する。
- フラグ管理用API経由で、リアルタイム更新が可能となる設計を検討する。
