# 機能フラグ管理テーブル設計書

## 概要
特定機能の有効/無効を動的に制御するためのフラグ情報を管理します。

## テーブル種類
- マスタ系

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

## サンプルデータ

| id | feature_name    | is_enabled | description         | created_at           | updated_at           |
|----|-----------------|------------|---------------------|----------------------|----------------------|
| 1  | new_dashboard   | TRUE       | 新ダッシュボード    | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | beta_feature    | FALSE      | Beta機能テスト用    | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | experimental    | TRUE       | 実験的機能          | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | dark_mode       | TRUE       | ダークモード機能    | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | experimental_feature | FALSE  | 実験的な新機能      | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | beta_dashboard       | TRUE   | β版ダッシュボード機能 | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |

## 備考
- フラグ管理により、リリース前や段階的な機能提供が容易になります.
- フラグ変更時のキャッシュ無効化や即時反映を実現する仕組みの検討を推奨します.
- フラグ変更時のキャッシュ無効化処理や即時反映機能の実装を検討すること.

## 解決策
- 機能フラグ変更時に、キャッシュ層の無効化を行い即時反映を実施する仕組みを導入する。
- フラグ管理用API経由で、リアルタイム更新が可能となる設計を検討する。
