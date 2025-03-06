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

## サンプルデータ
| id | page_url              | browser  | os   | error_message            | stack_trace | additional_data | occurred_at          | created_at           | updated_at           |
|----|-----------------------|----------|------|--------------------------|-------------|-----------------|----------------------|----------------------|----------------------|
| 1  | https://example.com   | Chrome   | NULL | Uncaught ReferenceError  | NULL        | NULL            | 2023-10-01 09:30:00  | 2023-10-01 09:30:00  | 2023-10-01 09:30:00  |
| 2  | https://example.com   | Firefox  | NULL | TypeError: undefined is not a function | NULL | NULL | 2023-10-02 10:00:00  | 2023-10-02 10:00:00  | 2023-10-02 10:00:00  |
| 3  | https://example.com   | Safari   | NULL | SyntaxError: Unexpected token | NULL | NULL | 2023-10-03 11:00:00  | 2023-10-03 11:00:00  | 2023-10-03 11:00:00  |
| 4  | https://example.com   | Edge     | NULL | RangeError: Maximum call stack size exceeded | NULL | NULL | 2023-10-04 12:00:00  | 2023-10-04 12:00:00  | 2023-10-04 12:00:00  |
| 5  | https://example.com   | Chrome   | NULL | ReferenceError: event is not defined | NULL | NULL | 2023-10-05 13:00:00  | 2023-10-05 13:00:00  | 2023-10-05 13:00:00  |
| 6  | https://example.com   | Firefox  | NULL | TypeError: Cannot read property 'length' of undefined | NULL | NULL | 2023-10-06 14:00:00  | 2023-10-06 14:00:00  | 2023-10-06 14:00:00  |

## 備考
- ユーザー環境の情報を元に、フロントエンドの改善ポイントを把握してください。

## 関係テーブル
- `user`: エラー発生時のユーザー情報を参照します。
