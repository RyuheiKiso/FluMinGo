# コードスニペットライブラリ

このドキュメントには、頻出のユースケースや実践的なパターンのコード例を集約しています。  
各コード例はプロジェクト内での利用を想定しており、参考情報として活用してください。

---

## 1. Flutter: API呼び出しサンプル

頻出のAPI呼び出し処理の例です。Dioパッケージを用いたHTTP GETの実装例を示します。

```dart
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> fetchUsers() async {
    try {
      final response = await _dio.get('https://api.example.com/users');
      print(response.data);
    } catch (e) {
      // エラーハンドリング
      print('Error fetching users: $e');
    }
  }
}
```

---

## 2. Golang: REST APIハンドラー

GolangでのREST APIのエンドポイント実装例です。標準ライブラリを使ってシンプルなGETハンドラーを実装しています。

```go
package main

import (
    "encoding/json"
    "log"
    "net/http"
)

type User struct {
    ID    int    `json:"id"`
    Name  string `json:"name"`
    Email string `json:"email"`
}

func usersHandler(w http.ResponseWriter, r *http.Request) {
    users := []User{
        {ID: 1, Name: "Taro", Email: "taro@example.com"},
        {ID: 2, Name: "Jiro", Email: "jiro@example.com"},
    }
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(users)
}

func main() {
    http.HandleFunc("/users", usersHandler)
    log.Println("Server start at :8080")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
```

---

## 3. SQL: データベース初期化スクリプト

PostgreSQL向けのテーブル作成と初期データ挿入の例です。

```sql
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email)
VALUES ('Taro', 'taro@example.com'),
       ('Jiro', 'jiro@example.com')
ON CONFLICT (email) DO NOTHING;
```

---

## 4. Shell: Docker Compose サンプル

簡単なDocker Composeファイルで、フロントエンド、バックエンド、DBの起動例です。

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
```

---

以上、各種コード例をご参照の上、プロジェクト内での利用シーンに合わせてカスタマイズしてください。