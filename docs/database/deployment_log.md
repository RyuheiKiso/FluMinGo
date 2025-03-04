# デプロイメントログテーブル設計書

## 概要
システムのデプロイ履歴を記録し、各リリースのバージョン、環境、デプロイ日時、変更内容などを管理します。

## テーブル定義
- テーブル名: `deployment_log`

| カラム名      | データ型      | 制約                                      | 説明                                  |
|---------------|---------------|-------------------------------------------|---------------------------------------|
| id            | INT           | PRIMARY KEY, AUTO_INCREMENT               | ログの一意な識別子                     |
| version       | VARCHAR(50)   | NOT NULL                                  | リリースバージョン（例: v1.2.3）         |
| environment   | VARCHAR(50)   | NOT NULL                                  | デプロイ先の環境（例: production, staging） |
| deployed_at   | DATETIME      | NOT NULL                                  | デプロイ実施日時                       |
| description   | TEXT          | DEFAULT NULL                              | 変更内容や備考                         |
| created_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP       | レコード作成日時                       |
| updated_at    | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時    |

## 備考
- 各デプロイの状況や変更内容を後から参照できるようにします。
- 定期的なログのローテーションやアーカイブ方法を検討してください.

## 解決策
- デプロイメントログ管理によりデプロイ履歴を正確に記録し、リリースのトラブルシュートや運用監査に役立てます.

## 固定値一覧
- environment: production, staging
- version: 例）v1.2.3
