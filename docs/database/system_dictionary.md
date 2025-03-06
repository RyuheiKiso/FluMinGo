# システム辞書マスタテーブル設計書

## 概要
システム全体で使用する辞書型データ（例: country, currency, unit など）を一元管理し、  
フロントエンドおよびバックエンド双方で固定参照値として利用します。

## テーブル種類
- マスタ系

## テーブル定義
- テーブル名: `system_dictionary`

| カラム名    | データ型      | 制約                                  | 説明                                    |
|-------------|---------------|---------------------------------------|-----------------------------------------|
| id          | INT           | PRIMARY KEY, AUTO_INCREMENT           | 一意な識別子                            |
| dict_type   | VARCHAR(100)  | NOT NULL                              | 辞書の種類（例: country, currency, unit）|
| dict_key    | VARCHAR(100)  | NOT NULL                              | 辞書キーまたはコード                    |
| dict_value  | VARCHAR(255)  | NOT NULL                              | 表示値または名称                         |
| description | TEXT          | DEFAULT NULL                          | 詳細説明                                |
| is_active   | BOOLEAN       | NOT NULL, DEFAULT TRUE                | 有効状態                                |
| created_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP   | レコード作成日時                        |
| updated_at  | DATETIME      | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | レコード更新日時            |

## サンプルデータ
| id | dict_type | dict_key | dict_value | is_active | created_at           | updated_at           |
|----|-----------|----------|------------|-----------|----------------------|----------------------|
| 1  | API       | API      | Application Programming Interface | TRUE | 2023-10-01 00:00:00  | 2023-10-01 00:00:00  |

## 備考
- dict_type と dict_key の組み合わせで一意性を検討してください。
- 固定参照値を管理し、システム間での統一的なデータ利用を促進します.

## 関係テーブル
- `user_preferences`: ユーザー設定の参照データとして利用される場合があります。
- `system_setting`: システム設定の参照データとして利用される場合があります。
