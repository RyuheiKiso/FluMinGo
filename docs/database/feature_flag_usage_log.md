# フィーチャーフラグ利用ログテーブル設計書

## 概要
機能フラグの利用状況を記録し、各ユーザーやシステムが特定のフラグをどのように利用しているかを追跡します。これにより、フラグ運用の効果測定や改善に役立てます。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `feature_flag_usage_log`

| カラム名         | データ型      | 制約                                      | 説明                                    |
|------------------|---------------|-------------------------------------------|-----------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                        |
| user_id          | INT           | DEFAULT NULL                              | フラグ利用したユーザーの識別子（`user` テーブル参照） |
| feature_flag_id  | INT           | NOT NULL                                  | 利用対象の機能フラグの識別子（`feature_flag` テーブル参照） |
| is_enabled       | BOOLEAN       | NOT NULL                                  | フラグが有効か無効かの状態                |
| triggered_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | フラグ利用がトリガされた日時             |
| details          | TEXT          | DEFAULT NULL                              | 補足情報（JSON形式推奨）                |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                        |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## 備考
- `user_id` および `feature_flag_id` はそれぞれ `user` テーブルと `feature_flag` テーブルの主キーへの外部キーとして設定してください。
- 利用パターン分析や機能切り替えの効果測定にご活用ください。

## サンプルデータ
| id | user_id | feature_flag_id | is_enabled | triggered_at          | created_at           | updated_at           |
|----|---------|-----------------|------------|-----------------------|----------------------|----------------------|
| 1  | 10      | 1               | TRUE       | 2023-10-01 10:00:00   | 2023-10-01 10:00:00  | 2023-10-01 10:00:00  |
| 2  | 20      | 2               | FALSE      | 2023-10-02 11:00:00   | 2023-10-02 11:00:00  | 2023-10-02 11:00:00  |
| 3  | 30      | 3               | TRUE       | 2023-10-03 12:00:00   | 2023-10-03 12:00:00  | 2023-10-03 12:00:00  |
