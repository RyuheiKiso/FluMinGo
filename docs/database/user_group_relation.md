## ユーザーグループ関連テーブル

各グループに所属するユーザーを管理するリレーションテーブルです。

## テーブル定義
- テーブル名: `user_group_relation`

| カラム名   | データ型     | 制約                                                            | 説明                                          |
|------------|--------------|-----------------------------------------------------------------|-----------------------------------------------|
| id         | INT          | PRIMARY KEY, AUTO_INCREMENT                                     | リレーションの一意な識別子                      |
| user_id    | INT          | NOT NULL                                                        | 対象ユーザーの識別子 (`user` テーブルの `id`)     |
| group_id   | INT          | NOT NULL                                                        | 対象グループの識別子 (`permission_group` テーブルの `id`)|
| role       | VARCHAR(50)  | DEFAULT NULL                                                    | グループ内での役割（例: 管理者、メンバー）         |
| created_at | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP                             | リレーション作成日時                           |
| updated_at | DATETIME     | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | リレーション更新日時                           |

## 備考
- 1人のユーザーが複数のグループに所属可能です。
- ユーザーに直接付与する権限設定と併用し、柔軟なアクセス制御を実現します。