# ディレクトリ構成

### Flutter

Flutterプロジェクトのディレクトリ構成は以下の通りです。これには、アプリケーションのUIやビジネスロジックが含まれます。

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

各ディレクトリは、シングルリスポンシビリティの原則に従い、モジュール化されています。

### golang(共通機能-API)

共通機能を提供するAPIのディレクトリ構成です。これには、認証やデータベース接続などの共通機能が含まれます。

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
- Flutter側はMVVMまたはBLoCパターンの実装を推奨
- Golang側はドメイン駆動設計（DDD）の考え方を取り入れ、レイヤーごとの役割分担を明確化しています。

各ディレクトリの詳細については、各ファイルのコメントを参照してください。
