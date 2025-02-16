
// フォームヘルパー
class FormHelper {
  // フォームフィールドのバリデーションメソッド
  static String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    return null;
  }
}