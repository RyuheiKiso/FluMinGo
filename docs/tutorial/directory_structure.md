# ディレクトリ構成

## Flutter プロジェクト概要
| フォルダ       | 役割                                      |
|----------------|-----------------------------------------|
| main.dart      | エントリーポイント                        |
| screens        | 各画面（home, login, profileなど）を管理    |
| util           | ユーティリティ機能（base_page, component 等） |

### Flutter
各フォルダは以下の役割を担います：
- **main.dart**：エントリーポイント
- **screens**：  
  - home, login, profileなど、各画面ごとにMVC構成を実装  
  - controller, model, viewで責務を分離
- **util**：ユーティリティ機能を集約  
  - base_page、component、encryptionなど、用途別に整理

Flutterプロジェクトのディレクトリ構成は、以下のように各フォルダが明確な役割を担っています。  
UI、ビジネスロジック、データ操作など、各層に分かれた設計により、コードの保守性と再利用性を向上します。

```plaintext
FluMinGo/flutter_app/lib
├── main.dart(エントリポイント)
├── screens(画面群)
│   ├── home(ホーム画面)
│   │   ├── controller
│   │   │   └── home_controller.dart(ホーム画面のコントローラ)
│   │   ├── model
│   │   │   └── home_model.dart(ホーム画面のモデル)
│   │   └── view
│   │       └── home_view.dart(ホーム画面のUI)
│   ├── login(ログイン画面)
│   │   ├── controller
│   │   │   └── login_controller.dart(ログイン処理のコントローラ)
│   │   ├── model
│   │   │   └── login_model.dart(ログイン処理のモデル)
│   │   └── view
│   │       └── login_view.dart(ログイン画面のUI)
│   └── profile(プロフィール画面)
│       ├── controller
│       │   └── profile_controller.dart(プロフィール画面のコントローラ)
│       ├── model
│       │   └── profile_model.dart(プロフィール情報モデル)
│       └── view
│           └── profile_view.dart(プロフィール画面のUI)
└── util(ユーティリティ)
    ├── base_page
    │   ├── base_page.dart(基底ページクラス)
    │   └── base_page_helper.dart(基底ページ関連のヘルパー)
    ├── component
    │   ├── accordion.dart(アコーディオンUI)
    │   ├── alert.dart(アラートUI)
    │   ├── app_bar.dart(アプリバーUI)
    │   ├── avatar.dart(アバターUI)
    │   ├── badge.dart(バッジUI)
    │   ├── bottom_navigation_bar.dart(ボトムナビゲーション)
    │   ├── breadcrumb.dart(パンくずリスト)
    │   ├── button.dart(ボタンUI)
    │   ├── card.dart(カードUI)
    │   ├── carousel.dart(カルーセルUI)
    │   ├── chip.dart(チップUI)
    │   ├── divider.dart(区切り線UI)
    │   ├── drawer.dart(ドロワーUI)
    │   ├── dropdown.dart(ドロップダウンUI)
    │   ├── expansion_panel.dart(展開パネルUI)
    │   ├── floating_action_button.dart(FAB)
    │   ├── glassmorphism_container.dart(グラスモーフィズム)
    │   ├── grid.dart(グリッドUI)
    │   ├── grid_view.dart(グリッド表示)
    │   ├── label.dart(ラベルUI)
    │   ├── list.dart(リストUI)
    │   ├── list_view.dart(リスト表示)
    │   ├── modal.dart(モーダルUI)
    │   ├── navigation_rail.dart(ナビゲーションレール)
    │   ├── pagination.dart(ページネーション)
    │   ├── progress_bar.dart(プログレスバーUI)
    │   ├── progress_indicator.dart(読み込みインジケータ)
    │   ├── rating.dart(評価UI)
    │   ├── rating_bar.dart(評価バーUI)
    │   ├── refresh_indicator.dart(更新インジケータ)
    │   ├── scaffold.dart(ページ骨組みUI)
    │   ├── search_bar.dart(検索バーUI)
    │   ├── slider.dart(スライダーUI)
    │   ├── snackbar.dart(スナックバーUI)
    │   ├── spinner.dart(スピナーUI)
    │   ├── stepper.dart(ステッパーUI)
    │   ├── switch.dart(スイッチUI)
    │   ├── tab_bar.dart(タブバーUI)
    │   ├── tab_view.dart(タブ表示)
    │   ├── table.dart(テーブルUI)
    │   ├── tabs.dart(タブ切り替え)
    │   ├── textbox.dart(テキストボックスUI)
    │   ├── timeline.dart(タイムラインUI)
    │   ├── toast.dart(トースト通知)
    │   ├── tooltip.dart(ツールチップUI)
    │   ├── tree.dart(ツリーUI)
    │   ├── tree_view.dart(ツリービュー)
    │   ├── wizard.dart(ウィザードUI)
    │   └── wizard_view.dart(ウィザード画面)
    ├── encryption
    │   └── encryption_helper.dart(暗号化機能)
    ├── error_handling
    │   └── error_handler.dart(エラーハンドリング)
    ├── form
    │   └── form_helper.dart(フォーム関連処理)
    ├── http
    │   └── http_client.dart(HTTPクライアント)
    ├── json
    │   └── json_helper.dart(JSON処理)
    ├── logging
    │   └── logging_helper.dart(ログ機能)
    ├── math
    │   └── math_helper.dart(数値計算)
    ├── sqlite
    │   └── sqlite_helper.dart(SQLite操作)
    ├── string
    │   └── string_helper.dart(文字列処理)
    ├── validation
    │   └── validation_helper.dart(バリデーション処理)
    └── xml
        └── xml_helper.dart(XML処理)
```

各ディレクトリは、システム設計の原則に従い、役割分担が明確化されています。  
また、各モジュールは単一責任の原則を遵守しており、変更に対する影響範囲を最小化する設計となっています。  
運用面では、定期的なコードレビューとリファクタリングにより、最新の技術動向にも対応可能です。

## golang プロジェクト概要
- **共通機能 (common_api)**  
  認証、DB接続、ロギングなど基盤機能を管理
- **個別API (interface_adapter / use_case / entities)**  
  API仕様、ビジネスロジック、データモデルを分離

### golang(共通機能-API)
- 認証、DB接続、ロギングなど、システム全体で共通利用する基盤機能を管理

```plaintext
FluMinGo/golang/common_api
├── auth
│   ├── auth_handler.go(認証ハンドラー)
│   └── auth_service.go(認証サービス)
├── db
│   ├── db_connection.go(DB接続)
│   └── db_queries.go(DBクエリ管理)
└── middleware
    ├── logging.go(ログミドルウェア)
    └── recovery.go(リカバリミドルウェア)
```

### golang(個別API_interface and adapter)

個別のAPIのインターフェースとアダプターのディレクトリ構成です。インターフェースはAPIの定義を、アダプターは具体的な実装を提供します。

```plaintext
FluMinGo/golang/specific_api/interface_adapter
├── user
│   ├── user_interface.go(ユーザーAPIのインターフェース)
│   └── user_adapter.go(ユーザーAPIのアダプター)
└── product
    ├── product_interface.go(商品APIのインターフェース)
    └── product_adapter.go(商品APIのアダプター)
```

### golang(個別API_use case)

個別のAPIのユースケースのディレクトリ構成です。ユースケースはビジネスロジックを実装します。

```plaintext
FluMinGo/golang/specific_api/use_case
├── user
│   ├── user_use_case.go(ユーザー関連ユースケース)
│   └── user_service.go(ユーザーサービス)
└── product
    ├── product_use_case.go(商品関連ユースケース)
    └── product_service.go(商品サービス)
```

### golang(個別API_entities)

個別のAPIのエンティティのディレクトリ構成です。エンティティはデータモデルを表現します。

```plaintext
FluMinGo/golang/specific_api/entities
├── user
│   ├── user.go(ユーザーモデル)
│   └── user_repository.go(ユーザーリポジトリ)
└── product
    ├── product.go(商品モデル)
    └── product_repository.go(商品リポジトリ)
```

### 補足 (高度な設計観点)
- 各ディレクトリはシングルリスポンシビリティの原則に従って設計され、変更の影響が最小限に抑えられます。
- ドキュメントとコードの整合性を維持し、定期的なレビューにより構造の最適化を図ることが推奨されます。
- Flutter側はMVVMまたはBLoCパターンの実装を推奨
- Golang側はドメイン駆動設計（DDD）の考え方を取り入れ、レイヤーごとの役割分担を明確化しています。

各ディレクトリの詳細については、各ファイルのコメントを参照してください。
