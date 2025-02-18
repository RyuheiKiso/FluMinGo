# ディレクトリ構成

### Flutter

Flutterプロジェクトのディレクトリ構成は以下の通りです。これには、アプリケーションのUIやビジネスロジックが含まれます。

```plaintext
FluMinGo/flutter_app/lib
├── main.dart
├── screens
│   ├── home
│   │   ├── controller
│   │   │   └── home_controller.dart
│   │   ├── model
│   │   │   └── home_model.dart
│   │   └── view
│   │       └── home_view.dart
│   ├── login
│   │   ├── controller
│   │   │   └── login_controller.dart
│   │   ├── model
│   │   │   └── login_model.dart
│   │   └── view
│   │       └── login_view.dart
│   └── profile
│       ├── controller
│       │   └── profile_controller.dart
│       ├── model
│       │   └── profile_model.dart
│       └── view
│           └── profile_view.dart
└── util
    ├── base_page
    │   ├── base_page.dart
    │   └── base_page_helper.dart
    ├── component
    │   ├── accordion.dart
    │   ├── alert.dart
    │   ├── app_bar.dart
    │   ├── avatar.dart
    │   ├── badge.dart
    │   ├── bottom_navigation_bar.dart
    │   ├── breadcrumb.dart
    │   ├── button.dart
    │   ├── card.dart
    │   ├── carousel.dart
    │   ├── chip.dart
    │   ├── divider.dart
    │   ├── drawer.dart
    │   ├── dropdown.dart
    │   ├── expansion_panel.dart
    │   ├── floating_action_button.dart
    │   ├── glassmorphism_container.dart
    │   ├── grid.dart
    │   ├── grid_view.dart
    │   ├── label.dart
    │   ├── list.dart
    │   ├── list_view.dart
    │   ├── modal.dart
    │   ├── navigation_rail.dart
    │   ├── pagination.dart
    │   ├── progress_bar.dart
    │   ├── progress_indicator.dart
    │   ├── rating.dart
    │   ├── rating_bar.dart
    │   ├── refresh_indicator.dart
    │   ├── scaffold.dart
    │   ├── search_bar.dart
    │   ├── slider.dart
    │   ├── snackbar.dart
    │   ├── spinner.dart
    │   ├── stepper.dart
    │   ├── switch.dart
    │   ├── tab_bar.dart
    │   ├── tab_view.dart
    │   ├── table.dart
    │   ├── tabs.dart
    │   ├── textbox.dart
    │   ├── timeline.dart
    │   ├── toast.dart
    │   ├── tooltip.dart
    │   ├── tree.dart
    │   ├── tree_view.dart
    │   ├── wizard.dart
    │   └── wizard_view.dart
    ├── encryption
    │   └── encryption_helper.dart
    ├── error_handling
    │   └── error_handler.dart
    ├── form
    │   └── form_helper.dart
    ├── http
    │   └── http_client.dart
    ├── json
    │   └── json_helper.dart
    ├── logging
    │   └── logging_helper.dart
    ├── math
    │   └── math_helper.dart
    ├── sqlite
    │   └── sqlite_helper.dart
    ├── string
    │   └── string_helper.dart
    ├── validation
    │   └── validation_helper.dart
    └── xml
        └── xml_helper.dart
```

### golang(共通機能-API)

共通機能を提供するAPIのディレクトリ構成です。これには、認証やデータベース接続などの共通機能が含まれます。

```plaintext
FluMinGo/golang/common_api
├── auth
│   ├── auth_handler.go
│   └── auth_service.go
├── db
│   ├── db_connection.go
│   └── db_queries.go
└── middleware
    ├── logging.go
    └── recovery.go
```

### golang(個別API_interface and adapter)

個別のAPIのインターフェースとアダプターのディレクトリ構成です。インターフェースはAPIの定義を、アダプターは具体的な実装を提供します。

```plaintext
FluMinGo/golang/specific_api/interface_adapter
├── user
│   ├── user_interface.go
│   └── user_adapter.go
└── product
    ├── product_interface.go
    └── product_adapter.go
```

### golang(個別API_use case)

個別のAPIのユースケースのディレクトリ構成です。ユースケースはビジネスロジックを実装します。

```plaintext
FluMinGo/golang/specific_api/use_case
├── user
│   ├── user_use_case.go
│   └── user_service.go
└── product
    ├── product_use_case.go
    └── product_service.go
```

### golang(個別API_entities)

個別のAPIのエンティティのディレクトリ構成です。エンティティはデータモデルを表現します。

```plaintext
FluMinGo/golang/specific_api/entities
├── user
│   ├── user.go
│   └── user_repository.go
└── product
    ├── product.go
    └── product_repository.go
