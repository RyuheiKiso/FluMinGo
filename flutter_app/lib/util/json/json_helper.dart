// 概要: JSONヘルパー
// 目的: JSONの変換や処理を支援し、データシリアライゼーションを効率化する
// 使用方法: JsonHelper.encode(object) または JsonHelper.decode(jsonString) を使用

library;

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
