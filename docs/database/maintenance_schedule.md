# 定期メンテナンス予定テーブル設計書

## 概要
システムの定期メンテナンス予定や実施状況を管理し、ユーザーへ告知するためのテーブルです。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `maintenance_schedule`

| カラム名         | データ型      | 制約                                     | 説明                                          |
|------------------|---------------|------------------------------------------|-----------------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT              | メンテナンス予定の一意な識別子                  |
| title            | VARCHAR(100)  | NOT NULL                                 | メンテナンスタイトル（例: 定期保守作業）          |
| description      | TEXT          | DEFAULT NULL                             | メンテナンスの詳細説明                         |
| scheduled_start  | DATETIME      | NOT NULL                                 | メンテナンス開始予定日時                        |
| scheduled_end    | DATETIME      | NOT NULL                                 | メンテナンス終了予定日時                        |
| is_completed     | BOOLEAN       | NOT NULL, DEFAULT FALSE                  | 作業完了状態                                   |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP      | レコード作成日時                              |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時           |

## 備考
- メンテナンス実施後にはis_completedをTRUEに更新する運用としてください.

## 関係テーブル
- `notification`: メンテナンス通知情報を管理する場合があります。

## サンプルデータ
| id | title             | scheduled_start         | scheduled_end           | is_completed | created_at           | updated_at           |
|----|-------------------|-------------------------|-------------------------|--------------|----------------------|----------------------|
| 1  | 定期保守作業      | 2023-12-01 01:00:00     | 2023-12-01 03:00:00     | FALSE        | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
