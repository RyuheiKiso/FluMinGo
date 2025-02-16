import 'package:http/http.dart' as http;

// HTTP3クライアントヘルパー
class Http3Client {
  final String baseUrl;

  Http3Client({required this.baseUrl});

  // GETリクエストを送信するメソッド
  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.get(url);
  }

  // POSTリクエストを送信するメソッド
  Future<http.Response> post(String endpoint, {required Map<String, dynamic> body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.post(url, body: body);
  }
}