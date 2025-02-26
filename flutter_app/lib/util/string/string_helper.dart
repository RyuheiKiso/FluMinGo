// 概要: 文字列操作のヘルパー
// 目的: 文字列の操作を簡単にする
// 使用方法: StringHelper.isEmpty('文字列')

class StringHelper {
  static bool isEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static String toUpperCase(String str) {
    return str.toUpperCase();
  }
}
