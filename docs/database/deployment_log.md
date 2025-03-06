# デプロイメントログテーブル設計書

## 概要
システムのデプロイ履歴を記録し、各リリースのバージョン、環境、デプロイ日時、変更内容などを管理します。

## テーブル種類
- トランザクション系

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

## 関係テーブル
- `ci_pipeline`: デプロイメントの実行元パイプライン情報を参照する場合があります。

## サンプルデータ

| id | version | environment  | deployed_at          | description         | created_at           | updated_at           |
|----|---------|--------------|----------------------|---------------------|----------------------|----------------------|
| 1  | v1.2.3  | production   | 2023-10-01 00:00:00  | 初回リリース        | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |
| 2  | v1.2.4  | staging      | 2023-11-05 00:00:00  | Staging deployment  | 2023-11-05 00:00:00  | 2023-11-05 00:00:00  |
| 3  | v1.2.5  | production   | 2023-12-01 00:00:00  | Minor bug fixes     | 2023-12-01 00:00:00  | 2023-12-01 00:00:00  |
| 4  | v1.2.6  | staging      | 2023-12-15 00:00:00  | Staging minor update| 2023-12-15 00:00:00  | 2023-12-15 00:00:00  |
| 5  | v1.2.7  | production   | 2023-12-20 00:00:00  | Critical bug fix    | 2023-12-20 00:00:00  | 2023-12-20 00:00:00  |
| 6  | v1.2.8  | staging      | 2023-12-25 00:00:00  | Minor update        | 2023-12-25 00:00:00  | 2023-12-25 00:00:00  |
| 7  | v1.2.9  | production   | 2024-01-01 00:00:00  | New Year release    | 2024-01-01 00:00:00  | 2024-01-01 00:00:00  |
| 8  | v1.3.0  | staging      | 2024-01-05 00:00:00  | Feature update      | 2024-01-05 00:00:00  | 2024-01-05 00:00:00  |
