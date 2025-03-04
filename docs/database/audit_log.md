# 監査ログテーブル設計書

## 概要

システム内で発生したデータ変更やその他重要なイベントを監査目的で記録するテーブルです。

## テーブル種類
- トランザクション系

## テーブル定義

- テーブル名: `audit_log`

| カラム名       | データ型      | 制約                                                          | 説明                                             |
|----------------|---------------|---------------------------------------------------------------|--------------------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT                                   | 監査ログの一意な識別子                              |
| user_id        | INT           | NOT NULL                                                      | イベントを実行したユーザーの識別子（`user` テーブルの `id`） |
| event_type     | VARCHAR(50)   | NOT NULL                                                      | イベントの種類（例: INSERT, UPDATE, DELETE 等）        |
| target_table   | VARCHAR(100)  | DEFAULT NULL                                                  | 変更が発生した対象テーブル名                        |
| record_id      | INT           | DEFAULT NULL                                                  | 影響を受けたレコードの識別子（対象テーブルの `id` 等）      |
| change_summary | VARCHAR(255)  | DEFAULT NULL                                                  | 変更の概要または理由                              |
| old_data       | TEXT          | DEFAULT NULL                                                  | 変更前のデータ（スナップショット等）                 |
| new_data       | TEXT          | DEFAULT NULL                                                  | 変更後のデータ（スナップショット等）                 |
| ip_address     | VARCHAR(45)   | DEFAULT NULL                                                  | 操作時のIPアドレス（IPv4/IPv6対応）                |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP                           | レコード作成日時                                |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                                |

## 備考

- `user_id` は `user` テーブルの主キーへの外部キーとして設定してください.
-- ALTER TABLE audit_log ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES user(id);
- 変更前後の状態はアプリケーションの要件に応じて JSON 形式などで保存することも検討してください.
- 監査ログはセキュリティやコンプライアンスの観点から重要なデータとなるため、適切なアクセス制御と保管方針を制定してください.
+ 監査ログの改ざん防止措置、長期保存ポリシー、及びバックアップ戦略の検討を推奨します.
- 改ざん防止のための署名、アクセス制御、及びバックアップ等の長期保存対策を実装することを推奨します.

## 解決策
- 監査ログにデジタル署名を付与することで、改ざん防止機構を実装する。
- アクセス制御と定期的なバックアップ、長期保存のためのポリシーを策定する。

## 固定値一覧
- event_type: INSERT, UPDATE, DELETE など

## サンプルデータ

| id | user_id | event_type | target_table | record_id | change_summary      | old_data   | new_data                                     | ip_address      | created_at           | updated_at           |
|----|---------|------------|--------------|-----------|---------------------|------------|----------------------------------------------|-----------------|----------------------|----------------------|
| 1  | 10      | UPDATE     | user         | 1         | email更新           | {}         | {"email": "new@example.com"}                 | 192.168.1.100   | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | 10      | INSERT     | notification | 2         | 新規追加            | {}         | {"message": "新規通知"}                      | 192.168.1.102   | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | 11      | DELETE     | user         | 3         | ユーザー削除        | {}         | {}                                          | 192.168.1.103   | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | 12      | UPDATE     | user_preferences | 4       | タイムゾーン更新   | {}         | {"timezone": "UTC"}                          | 192.168.1.105   | 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | 13      | INSERT     | api_token        | 5       | 新規APIトークン追加 | {}         | {"token": "new_api_token"}                   | 192.168.1.112   | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | 14      | UPDATE     | user             | 6       | email変更           | {"email": "old@example.com"} | {"email": "updated@example.com"} | 192.168.1.116   | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
