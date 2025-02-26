// 概要: フォームヘルパー
// 目的: フォームフィールドのバリデーションを支援する
// 使用方法: FormHelper.validateField(value, fieldName) などのバリデーションメソッドを使用

// フォームヘルパー
class FormHelper {
  // フォームフィールドのバリデーションメソッド
  static String? validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    return null;
  }

  // メールアドレスのバリデーションメソッド
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'メールアドレスを入力してください';
    }
    // 簡単なメールアドレスの正規表現
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) {
      return '有効なメールアドレスを入力してください';
    }
    return null;
  }

  // パスワードのバリデーションメソッド
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'パスワードを入力してください';
    }
    if (value.length < 8) {
      return 'パスワードは8文字以上で入力してください';
    }
    return null;
  }

  // 電話番号のバリデーションメソッド
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return '電話番号を入力してください';
    }
    // 簡単な電話番号の正規表現
    final regex = RegExp(r'^\d{10,15}$');
    if (!regex.hasMatch(value)) {
      return '有効な電話番号を入力してください';
    }
    return null;
  }

  // 数値フィールドのバリデーションメソッド
  static String? validateNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    final number = num.tryParse(value);
    if (number == null) {
      return '有効な数値を入力してください';
    }
    return null;
  }

  // URLのバリデーションメソッド
  static String? validateURL(String? value) {
    if (value == null || value.isEmpty) {
      return 'URLを入力してください';
    }
    // 簡単なURLの正規表現
    final regex = RegExp(r'^(https?|ftp)://[^\s/$.?#].[^\s]*$');
    if (!regex.hasMatch(value)) {
      return '有効なURLを入力してください';
    }
    return null;
  }

  // 日付のバリデーションメソッド
  static String? validateDate(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    try {
      DateTime.parse(value);
    } catch (e) {
      return '有効な日付を入力してください';
    }
    return null;
  }

  // 特定の長さのバリデーションメソッド
  static String? validateLength(
    String? value,
    String fieldName,
    int minLength,
    int maxLength,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    if (value.length < minLength || value.length > maxLength) {
      return '$fieldNameは$minLength文字以上$maxLength文字以下で入力してください';
    }
    return null;
  }

  // 特定の範囲内の数値のバリデーションメソッド
  static String? validateNumberRange(
    String? value,
    String fieldName,
    num min,
    num max,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    final number = num.tryParse(value);
    if (number == null) {
      return '有効な数値を入力してください';
    }
    if (number < min || number > max) {
      return '$fieldNameは$min以上$max以下の数値を入力してください';
    }
    return null;
  }

  // 特定のパターンのバリデーションメソッド
  static String? validatePattern(
    String? value,
    String fieldName,
    RegExp pattern,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    if (!pattern.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }

  // 特定の範囲内の日付のバリデーションメソッド
  static String? validateDateRange(
    String? value,
    String fieldName,
    DateTime minDate,
    DateTime maxDate,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    try {
      final date = DateTime.parse(value);
      if (date.isBefore(minDate) || date.isAfter(maxDate)) {
        return '$fieldNameは${minDate.toIso8601String()}から${maxDate.toIso8601String()}の間で入力してください';
      }
    } catch (e) {
      return '有効な日付を入力してください';
    }
    return null;
  }

  // 特定の文字セットのバリデーションメソッド
  static String? validateCharacterSet(
    String? value,
    String fieldName,
    String allowedChars,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    final regex = RegExp('^[${RegExp.escape(allowedChars)}]*\$');
    if (!regex.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }

  // 特定の形式のバリデーションメソッド
  static String? validateFormat(
    String? value,
    String fieldName,
    String format,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    final regex = RegExp(format);
    if (!regex.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }

  // 特定の文字数のバリデーションメソッド
  static String? validateExactLength(
    String? value,
    String fieldName,
    int exactLength,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    if (value.length != exactLength) {
      return '$fieldNameは$exactLength文字で入力してください';
    }
    return null;
  }

  // 特定の文字列が含まれているかのバリデーションメソッド
  static String? validateContains(
    String? value,
    String fieldName,
    String substring,
    String errorMessage,
  ) {
    if (value == null || value.isEmpty) {
      return '$fieldNameを入力してください';
    }
    if (!value.contains(substring)) {
      return errorMessage;
    }
    return null;
  }
}
