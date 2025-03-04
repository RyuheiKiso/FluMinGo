# キャッシュ無効化ログテーブル設計書

## 概要
キャッシュの無効化処理の実施状況や理由、実施者等を記録し、システムのキャッシュ管理状態を監視します。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `cache_invalidation_log`

| カラム名      | データ型      | 制約                                      | 説明                                    |
|---------------|---------------|-------------------------------------------|-----------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                        |
| cache_key     | VARCHAR(255)  | NOT NULL                                  | 対象キャッシュのキー                      |
| invalidated_at| DATETIME      | NOT NULL                                  | キャッシュ無効化が実施された日時             |
| invalidated_by| INT           | DEFAULT NULL                              | 無効化を実施したユーザーの識別子 (`user.id`)  |
| reason        | TEXT          | DEFAULT NULL                              | 無効化実施理由                           |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                         |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## 備考
- `invalidated_by` は必要に応じて `user` テーブルの主キーへの外部キーとして設定してください.
