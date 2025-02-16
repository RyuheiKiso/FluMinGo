import 'dart:convert';

// JSONヘルパー
class JsonHelper {
  // オブジェクトをJSON文字列に変換するメソッド
  static String encode(Object object) {
    return jsonEncode(object);
  }

  // JSON文字列をオブジェクトに変換するメソッド
  static dynamic decode(String jsonString) {
    return jsonDecode(jsonString);
  }
}