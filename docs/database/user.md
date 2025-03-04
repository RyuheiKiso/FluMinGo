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

| id | last_name | first_name | display_name | email               | password_hash  | created_at           | updated_at           |
|----|-----------|------------|--------------|---------------------|----------------|----------------------|----------------------|
| 1  | 山田      | 太郎       | Taro         | taro@example.com    | hashed_pwd1    | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 佐藤      | 次郎       | Jiro         | jiro@example.com    | hashed_pwd2    | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | 鈴木      | 三郎       | Saburo       | suzuki@example.com  | hashed_pwd3    | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 高橋      | 四郎       | Shiro        | takahashi@example.com | hashed_pwd4  | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | 伊藤      | 五郎       | Goro         | goro@example.com      | hashed_pwd5 | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | 佐々木    | 六郎       | Rokuro       | rokuro@example.com    | hashed_pwd6 | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
