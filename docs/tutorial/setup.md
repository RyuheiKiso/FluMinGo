# セットアップ手順

### 目次
1. [前提条件](#前提条件)
2. [手順](#手順)
   1. [リポジトリのクローンと初期設定](#1-リポジトリのクローンと初期設定)
   2. [依存関係のインストール](#2-依存関係のインストール)
   3. [データベースセットアップ](#3-データベースセットアップ)
   4. [Docker環境でのセットアップ](#4-Docker環境でのセットアップ)
   5. [環境変数の設定](#5-環境変数の設定)
3. [補足 (高度なセットアップ)](#補足-高度なセットアップ)

### 前提条件
- Flutter SDK  
  ※ 最新安定版の利用および各プラットフォームごとの依存ライブラリの更新チェック
- Golang  
  ※ Module機能利用のため、バージョン互換性を事前検証
- PostgreSQL  
  ※ SSL接続、カスタムユーザー権限、バックアップ設定の確認

## 手順

### 1. リポジトリのクローンと初期設定
- クローン後、各サブモジュールの最新状態を確認
- 依存ライブラリのバージョン整合性をチェック
```bash
git clone https://github.com/your-repo/FluMinGo.git
cd FluMinGo
```

### 2. 依存関係のインストール
- ネットワーク・プロキシ設定の確認
- 環境変数の最適化を実施
```bash
flutter pub get
go mod tidy
```

### 3. データベースセットアップ
- 初回実行後、アクセス権限、拡張モジュールの確認
- エラーログ確認で問題箇所を特定
```bash
psql -U postgres -c "CREATE DATABASE flumingo;"
```

#### データの初期化
- 初期データをデータベースに挿入するためのSQLスクリプトを実行します。
```bash
psql -U postgres -d flumingo -f path/to/initial_data.sql
```

### 4. Docker環境でのセットアップ
- Docker Composeを使用して、開発環境を迅速に構築します。
- 各サービス（フロントエンド、バックエンド、データベース）をコンテナ化し、依存関係を管理します。

#### 手順
1. DockerとDocker Composeをインストール
2. `docker-compose.yml` ファイルをプロジェクトルートに配置
3. 以下のコマンドを実行して、コンテナを起動
```bash
docker-compose up --build
```

#### docker-compose.yml の例
```yaml
version: '3.8'
services:
  frontend:
    build: ./frontend
    ports:
      - "3000:3000"
  backend:
    build: ./backend
    ports:
      - "8080:8080"
  db:
    image: postgres:14
    environment:
      POSTGRES_DB: flumingo
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    ports:
      - "5432:5432"
    volumes:
      - ./path/to/initial_data.sql:/docker-entrypoint-initdb.d/initial_data.sql
```

### 5. 環境変数の設定
- 環境変数は、プロジェクトの設定や機密情報を管理するために使用します。
- `.env` ファイルをプロジェクトルートに配置し、必要な環境変数を定義します。

#### .env ファイルの例
```plaintext
FLUTTER_ENV=development
GO_ENV=development
DATABASE_URL=postgres://user:password@localhost:5432/flumingo
```

#### 環境変数の読み込み
- Flutter: `flutter_dotenv` パッケージを使用
- Golang: `godotenv` パッケージを使用

```dart
// Flutter
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  print(dotenv.env['FLUTTER_ENV']);
}
```

```go
// Golang
import (
    "github.com/joho/godotenv"
    "log"
    "os"
)

func main() {
    err := godotenv.Load()
    if err != nil {
        log.Fatal("Error loading .env file")
    }
    env := os.Getenv("GO_ENV")
    log.Println(env)
}
```

詳細なセットアップ手順については、各技術の公式ドキュメントを参照してください。

## 補足 (高度なセットアップ)
- **Docker/Kubernetes利用時**  
  - 環境変数の暗号化、シークレット管理ツールとの連携
  - ネットワークポリシーの適用
- **.envファイル**  
  - 秘密情報の管理方法も併せ検討
