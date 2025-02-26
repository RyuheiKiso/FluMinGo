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
  Future<http.Response> post(String endpoint, {required Map<String, dynamic> body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final bodyString = body.map((key, value) => MapEntry(key, value.toString()));
    return await http.post(url, body: bodyString);
  }
}