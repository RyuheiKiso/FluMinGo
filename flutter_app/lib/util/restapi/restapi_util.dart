// This file contains common functionalities for REST API

import 'package:http/http.dart' as http;
import 'dart:convert';

class RestApiUtil {
  final String baseUrl;

  RestApiUtil({required this.baseUrl});

  // GETリクエストを送信するメソッド
  Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    return response;
  }

  // POSTリクエストを送信するメソッド
  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }

  // PUTリクエストを送信するメソッド
  Future<http.Response> put(String endpoint, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }

  // DELETEリクエストを送信するメソッド
  Future<http.Response> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
    return response;
  }

  // PATCHリクエストを送信するメソッド
  Future<http.Response> patch(String endpoint, Map<String, dynamic> data) async {
    final response = await http.patch(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }

  // ヘッダーを追加するメソッド（デフォルトヘッダーを強化）
  Map<String, String> _addHeaders(Map<String, String>? headers) {
    final defaultHeaders = {'Content-Type': 'application/json', 'Accept': 'application/json'};
    if (headers != null) {
      defaultHeaders.addAll(headers);
    }
    return defaultHeaders;
  }

  // GETリクエストを送信するメソッド（ヘッダー付き）
  Future<http.Response> getWithHeaders(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
    );
    return response;
  }

  // POSTリクエストを送信するメソッド（ヘッダー付き）
  Future<http.Response> postWithHeaders(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
      body: jsonEncode(data),
    );
    return response;
  }

  // PUTリクエストを送信するメソッド（ヘッダー付き）
  Future<http.Response> putWithHeaders(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
      body: jsonEncode(data),
    );
    return response;
  }

  // DELETEリクエストを送信するメソッド（ヘッダー付き）
  Future<http.Response> deleteWithHeaders(String endpoint, {Map<String, String>? headers}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
    );
    return response;
  }

  // PATCHリクエストを送信するメソッド（ヘッダー付き）
  Future<http.Response> patchWithHeaders(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers}) async {
    final response = await http.patch(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
      body: jsonEncode(data),
    );
    return response;
  }

  // GETリクエストを送信するメソッド（ヘッダー付き、タイムアウト付き）
  Future<http.Response> getWithHeadersAndTimeout(String endpoint, {Map<String, String>? headers, Duration timeout = const Duration(seconds: 10)}) async {
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
    ).timeout(timeout);
    return response;
  }

  // POSTリクエストを送信するメソッド（ヘッダー付き、タイムアウト付き）
  Future<http.Response> postWithHeadersAndTimeout(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers, Duration timeout = const Duration(seconds: 10)}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
      body: jsonEncode(data),
    ).timeout(timeout);
    return response;
  }

  // PUTリクエストを送信するメソッド（ヘッダー付き、タイムアウト付き）
  Future<http.Response> putWithHeadersAndTimeout(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers, Duration timeout = const Duration(seconds: 10)}) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
      body: jsonEncode(data),
    ).timeout(timeout);
    return response;
  }

  // DELETEリクエストを送信するメソッド（ヘッダー付き、タイムアウト付き）
  Future<http.Response> deleteWithHeadersAndTimeout(String endpoint, {Map<String, String>? headers, Duration timeout = const Duration(seconds: 10)}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
    ).timeout(timeout);
    return response;
  }

  // PATCHリクエストを送信するメソッド（ヘッダー付き、タイムアウト付き）
  Future<http.Response> patchWithHeadersAndTimeout(String endpoint, Map<String, dynamic> data, {Map<String, String>? headers, Duration timeout = const Duration(seconds: 10)}) async {
    final response = await http.patch(
      Uri.parse('$baseUrl$endpoint'),
      headers: _addHeaders(headers),
      body: jsonEncode(data),
    ).timeout(timeout);
    return response;
  }
}

// 使用方法例：
// final api = RestApiUtil(baseUrl: 'https://api.example.com');
// GETリクエスト
// api.get('/endpoint');
// POSTリクエスト
// api.post('/endpoint', {'key': 'value'});
// PUTリクエスト
// api.put('/endpoint', {'key': 'value'});
// DELETEリクエスト
// api.delete('/endpoint');
// PATCHリクエスト
// api.patch('/endpoint', {'key': 'value'});
// GETリクエスト（ヘッダー付き）
// api.getWithHeaders('/endpoint', headers: {'Authorization': 'Bearer token'});
// POSTリクエスト（ヘッダー付き）
// api.postWithHeaders('/endpoint', {'key': 'value'}, headers: {'Authorization': 'Bearer token'});
// PUTリクエスト（ヘッダー付き）
// api.putWithHeaders('/endpoint', {'key': 'value'}, headers: {'Authorization': 'Bearer token'});
// DELETEリクエスト（ヘッダー付き）
// api.deleteWithHeaders('/endpoint', headers: {'Authorization': 'Bearer token'});
