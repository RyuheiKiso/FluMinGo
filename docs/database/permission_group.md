## 権限グループ管理テーブル

このドキュメントは、部門やチームなどのグループ情報および各グループに対する権限設定を管理するテーブル設計および仕様を示します。

### テーブル定義
- テーブル名: `permission_group`

| カラム名    | データ型      | 制約                                        | 説明                                    |
|-------------|---------------|---------------------------------------------|-----------------------------------------|
| id          | INT           | PRIMARY KEY, AUTO_INCREMENT                 | グループの一意な識別子                   |
| group_name  | VARCHAR(100)  | NOT NULL, UNIQUE                            | グループ名（例: 部門名、チーム名）         |
| group_type  | VARCHAR(50)   | DEFAULT NULL                                | グループの種類（例: 部門、チーム）          |
| description | TEXT          | DEFAULT NULL                                | グループの詳細説明                       |
| created_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP         | レコード作成日時                        |
| updated_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時                        |

### 備考
- グループ名は一意であり、同名のグループの重複を防止します。
- 必要に応じて、グループ間の階層構造などの拡張も検討してください。

