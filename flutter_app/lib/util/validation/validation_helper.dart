// バリデーションヘルパー
class ValidationHelper {
  // メールアドレスのバリデーションメソッド
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(email);
  }

  // パスワードのバリデーションメソッド
  static bool isValidPassword(String password) {
    return password.length >= 8;
  }
}
