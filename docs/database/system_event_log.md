# システムイベントログテーブル設計書

## 概要
システムが発生する各種イベント（例: startup, shutdown, error, maintenance）を記録し、運用監視やトラブルシュートに役立てます。

## テーブル種類
- トランザクション系

## テーブル定義
- テーブル名: `system_event_log`

| カラム名        | データ型    | 制約                                      | 説明                                       |
|-----------------|-------------|-------------------------------------------|--------------------------------------------|
| id              | INT         | PRIMARY KEY, AUTO_INCREMENT               | イベントの一意な識別子                        |
| event_type      | VARCHAR(50) | NOT NULL                                  | イベントの種類（例: startup, shutdown, error, maintenance） |
| description     | TEXT        | DEFAULT NULL                              | イベントの詳細説明                          |
| event_timestamp | DATETIME    | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | イベント発生日時                           |
| created_at      | DATETIME    | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                            |
| updated_at      | DATETIME    | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時           |

## 備考
- 各種システムイベントをリアルタイムに監視し、運用・監査の基盤として利用します.
- イベント種別に応じた通知や自動処理と連携する際の基盤となります.

## サンプルデータ
| id | event_type | description      | event_timestamp      | created_at           | updated_at           |
|----|------------|------------------|----------------------|----------------------|----------------------|
| 1  | login      | User logged in   | 2023-10-01 09:00:00  | 2023-10-01 09:00:00  | 2023-10-01 09:00:00  |
