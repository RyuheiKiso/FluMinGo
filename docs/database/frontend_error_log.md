# フロントエンドエラーログテーブル設計書

## 概要
ブラウザ上で発生したエラーや例外を記録し、ユーザー環境（URL、ブラウザ、OS等）と共に管理することで、
迅速な原因特定や改善に役立てます。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `frontend_error_log`

| カラム名         | データ型      | 制約                                      | 説明                                    |
|------------------|---------------|-------------------------------------------|-----------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                        |
| user_id          | INT           | DEFAULT NULL                              | エラー発生時のユーザー識別子（`user` テーブル参照） |
| page_url         | VARCHAR(255)  | NOT NULL                                  | エラー発生ページのURL                      |
| browser          | VARCHAR(100)  | NOT NULL                                  | ブラウザ名（例: Chrome, Firefox 等）        |
| os               | VARCHAR(100)  | DEFAULT NULL                              | 利用OS                                   |
| error_message    | TEXT          | NOT NULL                                  | エラーメッセージ                          |
| stack_trace      | TEXT          | DEFAULT NULL                              | スタックトレース                          |
| additional_data  | TEXT          | DEFAULT NULL                              | 任意の追加情報（JSON形式推奨）              |
| occurred_at      | DATETIME      | NOT NULL                                  | エラー発生日時                           |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                        |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## 備考
- ユーザー環境の情報を元に、フロントエンドの改善ポイントを把握してください。
