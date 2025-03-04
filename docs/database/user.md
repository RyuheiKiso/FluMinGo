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

## 解決策
- 複合ユニーク制約およびインデックス（例：idx_email）を設計と実装に反映する。
- セキュリティ強化のため、パスワードハッシュアルゴリズムのアップデートを検討する。

## サンプルデータ
```sql
INSERT INTO user (last_name, first_name, display_name, email, password_hash, created_at, updated_at)
VALUES
  ('山田', '太郎', 'Taro', 'taro@example.com', 'hashed_password1', NOW(), NOW()),
  ('佐藤', '花子', 'Hanako', 'hanako@example.com', 'hashed_password2', NOW(), NOW());
