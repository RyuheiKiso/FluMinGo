# オンボーディングガイド

## 目的
- 新規メンバーがプロジェクトの構造、利用技術、セットアップ方法を具体的に把握できるようにする。

## セットアップ手順
1. **リポジトリのクローン**  
   - ターミナルで以下を実行  
     ```bash
     git clone https://github.com/your-org/FluMinGo.git
     cd FluMinGo
     ```
   - ※Gitの基本操作やクローンの意味については、公式ドキュメントや「Git入門」を参照してください
   - 各サブモジュールも更新する場合は `git submodule update --init --recursive` を実行
2. **依存関係のインストール**  
   - Flutterの場合:  
     ```bash
     flutter pub get
     ```  
   - Golangの場合:  
     ```bash
     go mod tidy
     ```
   - ※各コマンド実行後、エラーが出た場合は、エラーメッセージの内容と対処方法をテスト環境で確認してください
3. **環境変数の設定**  
   - プロジェクトルートに`.env`ファイルを作成し、下記例のように設定  
     ```plaintext
     FLUTTER_ENV=development
     GO_ENV=development
     DATABASE_URL=postgres://user:password@localhost:5432/flumingo
     ```
   - ※隠しファイルとして扱われるため、エディタの表示設定に注意

## 主要コンポーネントの解説
- **diフォルダ**：依存性注入設定  
  - 例: injection_container.dart には、各サービスの初期化と登録の流れが記載されています。初心者は、DIの基本概念（なぜ依存性注入が必要か）を補足資料で学習してください。
- **screensフォルダ**：各画面のUIとロジック（MVC/MVVM）の分離  
  - 例: login_view.dart では、ユーザー認証やエラーハンドリングの具体的なコードが記されています。各画面ファイルの役割を図解で補足すると理解が深まります。
- **utilフォルダ**：共通のユーティリティ関数群  
  - 例: HTTPクライアントやエラー処理のヘルパー関数が実装されており、他の箇所への再利用方法を具体例で示すと親切です
// ...詳細は必要に応じて記載...
