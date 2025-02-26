// 概要: HTTPクライアントヘルパー
// 目的: HTTPリクエストの送信を簡素化する
// 使用方法: HttpClient(baseUrl: 'https://example.com').get('/endpoint') または post('/endpoint', body: {...}) を使用

import 'package:http/http.dart' as http;

// HTTPクライアントヘルパー
class HttpClient {
  final String baseUrl;

  HttpClient({required this.baseUrl});

  // GETリクエストを送信するメソッド
  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.get(url);
  }

  // POSTリクエストを送信するメソッド
  Future<http.Response> post(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final bodyString = body.map(
      (key, value) => MapEntry(key, value.toString()),
    );
    return await http.post(url, body: bodyString);
  }
}
