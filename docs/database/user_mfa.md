# ユーザー多要素認証テーブル設計書

## 概要
ユーザーの多要素認証（MFA）設定と認証情報を管理します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `user_mfa`

| カラム名       | データ型      | 制約                                      | 説明                                          |
|----------------|---------------|-------------------------------------------|-----------------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT               | レコードの一意な識別子                          |
| user_id        | INT           | NOT NULL                                  | ユーザーの識別子（`user` テーブル参照）         |
| provider       | VARCHAR(50)   | NOT NULL                                  | MFAプロバイダ名（例: TOTP, SMS）                |
| mfa_secret     | VARCHAR(255)  | NOT NULL                                  | MFAシークレットまたは設定データ                |
| recovery_codes | TEXT          | DEFAULT NULL                              | バックアップ用リカバリーコード（JSON形式推奨）   |
| is_enabled     | BOOLEAN       | NOT NULL, DEFAULT FALSE                   | MFAの有効状態                                  |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                              |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                |

## サンプルデータ

| id | user_id | provider | mfa_secret       | recovery_codes | is_enabled | created_at           | updated_at           |
|----|---------|----------|------------------|----------------|------------|----------------------|----------------------|
| 1  | 1       | TOTP     | secret_example_1 | ["code1", "code2"] | TRUE       | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |

## 備考
- `user_id` は `user` テーブルの主キーへの外部キーとして設定してください。
- MFA設定の更新時はリカバリーコードの再生成やMFA無効化手続きを実装してください。

## 関係テーブル
- `user`: MFA設定の所有者情報を参照します。
