# ディレクトリ構成

### Flutter

Flutterプロジェクトのディレクトリ構成は以下の通りです。これには、アプリケーションのUIやビジネスロジックが含まれます。

```plaintext
/Users/kubota/Desktop/dev/FluMinGo/flutter_app/lib
├── main.dart
├── screens
│   ├── home_screen.dart
│   └── settings_screen.dart
├── widgets
│   ├── custom_button.dart
│   └── custom_text.dart
└── models
    ├── user_model.dart
    └── settings_model.dart
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
