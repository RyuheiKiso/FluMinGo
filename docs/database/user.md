# ユーザーテーブル設計書

## 概要
ユーザーの基本情報を管理するテーブルです。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `user`

| カラム名      | データ型     | 制約                                              | 説明                                  |
|---------------|--------------|---------------------------------------------------|---------------------------------------|
| id            | INT          | PRIMARY KEY, AUTO_INCREMENT                       | ユーザーの一意な識別子                  |
| last_name     | VARCHAR(50)  | NOT NULL                                          | ユーザーの姓                         |
| first_name    | VARCHAR(50)  | NOT NULL                                          | ユーザーの名                         |
| display_name  | VARCHAR(100) | DEFAULT NULL                                      | 表示名（ニックネーム等）               |
| email         | VARCHAR(100) | NOT NULL, UNIQUE                                  | メールアドレス                       |
| password_hash | VARCHAR(255) | NOT NULL                                          | ハッシュ化されたパスワード            |
| created_at    | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP               | レコード作成日時                      |
| updated_at    | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時      |

## 備考
- 姓と名の組み合わせでの一意性を確認する場合は、複合ユニーク制約を設定してください。
- パスワードのセキュリティ向上のため、bcryptやargon2などのハッシュアルゴリズムの利用を推奨します。
- emailやdisplay_nameへのインデックス追加も検討し、検索パフォーマンス向上を図ってください。
- 姓と名の組み合わせの一意性確保例:
  ALTER TABLE user ADD UNIQUE (last_name, first_name);
- email, display_nameへのインデックス追加も検討すること（例: CREATE INDEX idx_email ON user(email);）

## 関係テーブル
- `user_session`: ユーザーのセッション情報を管理します。
- `user_preferences`: ユーザーの個別設定を管理します。
- `user_mfa`: ユーザーの多要素認証情報を管理します。
- `user_group_relation`: ユーザーとグループの関連情報を管理します。
- `user_feedback`: ユーザーからのフィードバック情報を管理します。
- `webhook_subscription`: Webhookサブスクリプションの所有者情報を管理します。

## 解決策
- 複合ユニーク制約およびインデックス（例：idx_email）を設計と実装に反映する。
- セキュリティ強化のため、パスワードハッシュアルゴリズムのアップデートを検討する。

## サンプルデータ

| id | last_name | first_name | display_name | email               | password_hash | created_at           | updated_at           |
|----|-----------|------------|--------------|---------------------|----------------|----------------------|----------------------|
| 1  | 山田      | 太郎       | yamataro     | yamataro@example.com| hash1          | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 佐藤      | 次郎       | satojiro     | satojiro@example.com| hash2          | 2023-11-01 00:00:00  | 2023-11-01 00:00:00  |
| 3  | 鈴木      | 三郎       | suzukisaburo | suzukisaburo@example.com| hash3      | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 高橋      | 四郎       | takahashishiro | takahashishiro@example.com| hash4  | 2024-01-01 00:00:00  | 2024-01-01 00:00:00  |
