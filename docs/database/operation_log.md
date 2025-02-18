## 操作ログテーブル

ユーザーの操作（ログイン、更新、削除等）を記録するテーブルです。

### テーブル定義
- テーブル名: `operation_log`

| カラム名         | データ型      | 制約                                      | 説明                                               |
|------------------|---------------|-------------------------------------------|----------------------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT               | 操作ログの一意な識別子                              |
| user_id          | INT           | NOT NULL                                  | 操作を実行したユーザーの識別子。`user`テーブルの `id`への参照 |
| operation_type   | VARCHAR(50)   | NOT NULL                                  | 操作の種類（例: login, update, delete等）          |
| operation_detail | TEXT          | DEFAULT NULL                              | 操作詳細、エラーメッセージ等                        |
| ip_address       | VARCHAR(45)   | DEFAULT NULL                              | 操作者のIPアドレス（IPv4/IPv6対応）                |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP        | レコード作成日時                                  |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

### 備考
- `user_id`は`user`テーブルの主キーを参照する外部キーとして設定してください。
- 適切なデータ整合性チェックを実装してください。
- ログは監査・トラブルシュート目的で利用します。保管期間やアーカイブポリシーの策定を検討してください。
