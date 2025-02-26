import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/util/http/http_client.dart';

void main() {
  group('HttpClient Tests', () {
    test('GET request returns a successful response', () async {
      final client = HttpClient(baseUrl: 'https://jsonplaceholder.typicode.com');
      final response = await client.get('/posts/1');
      expect(response.statusCode, 200);
    });

    test('POST request returns a successful response', () async {
      final client = HttpClient(baseUrl: 'https://jsonplaceholder.typicode.com');
      final response = await client.post('/posts', body: {'title': 'foo', 'body': 'bar', 'userId': 1});
      expect(response.statusCode, 201);
    });
  });
}
