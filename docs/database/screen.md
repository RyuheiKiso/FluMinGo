## 機能（画面）管理テーブル

ドキュメントは、アプリケーション内の各画面に関する情報の管理について説明します。

### テーブル定義
- テーブル名: `screen`

| カラム名     | データ型      | 制約                                    | 説明                                   |
|--------------|---------------|-----------------------------------------|----------------------------------------|
| id           | INT           | PRIMARY KEY, AUTO_INCREMENT             | 画面の一意な識別子                       |
| parent_id    | INT           | DEFAULT NULL                            | 親画面のID（NULLの場合は最上位の画面）    |
| screen_name  | VARCHAR(100)  | NOT NULL, UNIQUE                        | 画面の名称                             |
| route        | VARCHAR(255)  | NOT NULL                                | 画面へのルーティングパス                |
| description  | TEXT          | DEFAULT NULL                            | 画面の詳細説明                         |
| icon         | VARCHAR(255)  | DEFAULT NULL                            | アイコンのパスまたは識別子               |
| created_at   | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP     | レコード作成日時                        |
| updated_at   | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時          |

### 備考
- `screen_name`は各画面を一意に識別するための名称です。
- `route`は画面遷移管理に使用します。
- 必要に応じて追加カラムやリレーションの設定を検討してください。
