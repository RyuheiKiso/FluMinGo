# エラーログテーブル設計書

## 概要
システム内で発生したエラーや例外を記録するテーブルです。

## テーブル定義
- テーブル名: `error_log`

| カラム名      | データ型      | 制約                                      | 説明                                  |
|---------------|---------------|-------------------------------------------|---------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | エラーログの一意な識別子               |
| error_code    | VARCHAR(50)   | DEFAULT NULL                              | エラーコード                         |
| error_message | TEXT          | NOT NULL                                  | エラーメッセージ                     |
| stack_trace   | TEXT          | DEFAULT NULL                              | スタックトレース（任意）              |
| occurred_at   | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | エラー発生日時                       |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                     |

## 備考
- エラーの重要度や発生箇所に応じたログ解析に利用できます。
