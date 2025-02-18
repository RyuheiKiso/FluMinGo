# セットアップ手順

### 前提条件
- Flutter SDK
- Golang
- PostgreSQL

### 手順
1. リポジトリをクローンします。
    ```bash
    git clone https://github.com/your-repo/FluMinGo.git
    cd FluMinGo
    ```
2. 必要な依存関係をインストールします。
    ```bash
    flutter pub get
    go mod tidy
    ```
3. データベースをセットアップします。
    ```bash
    psql -U postgres -c "CREATE DATABASE flumingo;"
    ```

詳細なセットアップ手順については、各技術の公式ドキュメントを参照してください。
