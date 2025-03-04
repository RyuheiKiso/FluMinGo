# APIドキュメント管理テーブル設計書

## 概要
各APIエンドポイントの仕様、利用例、パラメータなどを管理し、開発者向けに最新情報を提供します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `api_documentation`

| カラム名         | データ型      | 制約                                      | 説明                                          |
|------------------|---------------|-------------------------------------------|-----------------------------------------------|
| id               | INT           | PRIMARY KEY, AUTO_INCREMENT               | ドキュメントの一意な識別子                      |
| endpoint         | VARCHAR(255)  | NOT NULL, UNIQUE                          | APIエンドポイントのURLパス                     |
| method           | VARCHAR(10)   | NOT NULL                                  | HTTPメソッド（例: GET, POST）                  |
| summary          | VARCHAR(255)  | NOT NULL                                  | APIの概要説明                                  |
| parameters       | TEXT          | DEFAULT NULL                              | パラメータ詳細（JSON形式推奨）                 |
| request_example  | TEXT          | DEFAULT NULL                              | リクエスト例                                   |
| response_example | TEXT          | DEFAULT NULL                              | レスポンス例                                   |
| created_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                              |
| updated_at       | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時      |

## サンプルデータ
| id | endpoint      | method | summary          | parameters               | request_example   | response_example   | created_at           |
|----|---------------|--------|------------------|--------------------------|-------------------|--------------------|----------------------|
| 1  | /api/v1/items | GET    | アイテム一覧取得 | {"limit": "number"}      | {"limit": 10}     | {"items": []}      | 2023-10-01 00:00:00  |

## 備考
- API仕様変更時には本テーブルの内容も更新し、最新の状態を保ってください.
