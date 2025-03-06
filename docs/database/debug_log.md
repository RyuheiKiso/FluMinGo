# Debugログテーブル設計書

## 概要
システム開発・デバッグ時の詳細なログ（ログレベル、メッセージ、発生箇所など）を記録し、原因特定や不具合修正に役立てます。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `debug_log`

| カラム名      | データ型      | 制約                                     | 説明                                           |
|---------------|---------------|------------------------------------------|------------------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT              | ログの一意な識別子                             |
| developer_id  | INT           | DEFAULT NULL                             | ログ記録者（必要に応じて `user` テーブル参照）    |
| level         | VARCHAR(50)   | NOT NULL                                 | ログレベル（例: DEBUG, INFO, WARN, ERROR）      |
| message       | TEXT          | NOT NULL                                 | ログメッセージ                                 |
| file          | VARCHAR(255)  | DEFAULT NULL                             | ログ発生元のファイルパス                        |
| line          | INT           | DEFAULT NULL                             | 発生箇所の行番号                               |
| context       | TEXT          | DEFAULT NULL                             | 補足情報／コンテキスト                         |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP      | ログ記録日時                                   |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | ログ更新日時           |

## 備考
- 必要に応じて、developer_idでログの記録者や発生環境を管理できます。
- デバッグ専用テーブルにつき、開発環境での利用やログレベルの制御をご検討ください.

## 関係テーブル
- `user`: ログ記録者の情報を参照する場合があります。

## サンプルデータ
| id | developer_id | level  | message                   | file                  | line | created_at           | updated_at           |
|----|--------------|--------|---------------------------|-----------------------|------|----------------------|----------------------|
| 1  | NULL         | DEBUG  | "Variable x is undefined" | /app/main.js          | 42   | 2023-10-01 14:00:00  | 2023-10-01 14:00:00  |
| 2  | 1            | ERROR  | "Null pointer exception"  | /app/service.js       | 88   | 2023-10-02 10:00:00  | 2023-10-02 10:00:00  |
| 3  | 2            | WARN   | "Deprecated API usage"    | /app/util.js          | 120  | 2023-10-03 09:00:00  | 2023-10-03 09:00:00  |
| 4  | 3            | INFO   | "Service started"         | /app/server.js        | 5    | 2023-10-04 08:00:00  | 2023-10-04 08:00:00  |
| 5  | NULL         | DEBUG  | "User login successful"   | /app/auth.js          | 200  | 2023-10-05 07:00:00  | 2023-10-05 07:00:00  |
