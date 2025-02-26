// 文字列ヘルパー
class StringHelper {
  // 文字列が空かどうかを確認するメソッド
  static bool isEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  // 文字列を大文字に変換するメソッド
  static String toUpperCase(String str) {
    return str.toUpperCase();
  }
}
