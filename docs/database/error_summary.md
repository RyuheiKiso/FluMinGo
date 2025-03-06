# エラー集計レポートテーブル設計書

## 概要
フロントエンド／バックエンド各モジュールで発生したエラーをエラー種別ごとに集計し、  
発生件数や傾向を把握するためのテーブルです。

## テーブル種類
- レポート系

## テーブル定義
- テーブル名: `error_summary`

| カラム名     | データ型      | 制約                                     | 説明                                          |
|--------------|---------------|------------------------------------------|-----------------------------------------------|
| id           | INT           | PRIMARY KEY, AUTO_INCREMENT              | 集計レポートの一意な識別子                        |
| module       | VARCHAR(100)  | NOT NULL                                 | 対象モジュール（例: frontend, backend, 共通）    |
| error_type   | VARCHAR(50)   | NOT NULL                                 | エラー種別（例: network, application, system）  |
| error_count  | INT           | NOT NULL                                 | 発生件数                                      |
| report_date  | DATE          | NOT NULL                                 | 集計対象日                                    |
| created_at   | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP      | レコード作成日時                              |
| updated_at   | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時          |

## 備考
- 定期バッチで各モジュールからエラーログを集計し、本テーブルに登録・更新してください.

## 関係テーブル
- `error_log`: エラーログ情報を参照します。

## サンプルデータ
| id | module   | error_type  | error_count | report_date  | created_at           | updated_at           |
|----|----------|-------------|-------------|--------------|----------------------|----------------------|
| 1  | backend  | database    | 5           | 2023-10-01   | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | frontend | network     | 3           | 2023-10-02   | 2023-10-02 00:00:00  | 2023-10-02 00:00:00  |
| 3  | backend  | application | 7           | 2023-10-03   | 2023-10-03 00:00:00  | 2023-10-03 00:00:00  |
