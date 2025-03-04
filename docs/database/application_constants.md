# アプリケーション定数マスタテーブル設計書

## 概要
システム全体で利用する定数（例: 数値上限、デフォルト値、閾値など）を一元管理するテーブルです。  
フロントエンドおよびバックエンド双方で参照し、環境依存の固定値の一元管理に活用します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `application_constants`

| カラム名       | データ型      | 制約                                      | 説明                                   |
|----------------|---------------|-------------------------------------------|----------------------------------------|
| id             | INT           | PRIMARY KEY, AUTO_INCREMENT               | 定数の一意な識別子                      |
| constant_key   | VARCHAR(100)  | NOT NULL, UNIQUE                          | 定数キー（例: MAX_UPLOAD_SIZE）         |
| constant_value | VARCHAR(255)  | NOT NULL                                  | 定数値（例: 10485760）                   |
| description    | TEXT          | DEFAULT NULL                              | 定数の詳細説明                         |
| is_active      | BOOLEAN       | NOT NULL, DEFAULT TRUE                    | 有効状態                               |
| created_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at     | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時         |

## 備考
- constant_key による一意性を確保してください。
- アプリケーションの動作条件や上限値などを動的に変更・参照する基盤としてご活用ください.
