import 'package:flutter/material.dart';
import 'package:flutter_app/util/error_handling/error_handler.dart';
import '../form/form_helper.dart'; // フォームヘルパーをインポート

// ベースページクラス
class BasePage extends StatelessWidget {
  // タイトル
  final String title;
  // ボディ
  final Widget body;

  // コンストラクタ
  const BasePage({super.key, required this.title, required this.body});

  // エラーを表示するメソッド
  void showError(BuildContext context, String message) {
    ErrorHandler.showError(context, message);
  }

  // フォームフィールドのバリデーションメソッド
  String? validateField(String? value, String fieldName) {
    return FormHelper.validateField(value, fieldName);
  }

  // メールアドレスのバリデーションメソッド
  String? validateEmail(String? value) {
    return FormHelper.validateEmail(value);
  }

  // パスワードのバリデーションメソッド
  String? validatePassword(String? value) {
    return FormHelper.validatePassword(value);
  }

  // 電話番号のバリデーションメソッド
  String? validatePhoneNumber(String? value) {
    return FormHelper.validatePhoneNumber(value);
  }

  // 数値フィールドのバリデーションメソッド
  String? validateNumber(String? value, String fieldName) {
    return FormHelper.validateNumber(value, fieldName);
  }

  // URLのバリデーションメソッド
  String? validateURL(String? value) {
    return FormHelper.validateURL(value);
  }

  // 日付のバリデーションメソッド
  String? validateDate(String? value, String fieldName) {
    return FormHelper.validateDate(value, fieldName);
  }

  // 特定の長さのバリデーションメソッド
  String? validateLength(String? value, String fieldName, int minLength, int maxLength) {
    return FormHelper.validateLength(value, fieldName, minLength, maxLength);
  }

  // 特定の範囲内の数値のバリデーションメソッド
  String? validateNumberRange(String? value, String fieldName, num min, num max) {
    return FormHelper.validateNumberRange(value, fieldName, min, max);
  }

  // 特定のパターンのバリデーションメソッド
  String? validatePattern(String? value, String fieldName, RegExp pattern, String errorMessage) {
    return FormHelper.validatePattern(value, fieldName, pattern, errorMessage);
  }

  // 特定の範囲内の日付のバリデーションメソッド
  String? validateDateRange(String? value, String fieldName, DateTime minDate, DateTime maxDate) {
    return FormHelper.validateDateRange(value, fieldName, minDate, maxDate);
  }

  // 特定の文字セットのバリデーションメソッド
  String? validateCharacterSet(String? value, String fieldName, String allowedChars, String errorMessage) {
    return FormHelper.validateCharacterSet(value, fieldName, allowedChars, errorMessage);
  }

  // 特定の形式のバリデーションメソッド
  String? validateFormat(String? value, String fieldName, String format, String errorMessage) {
    return FormHelper.validateFormat(value, fieldName, format, errorMessage);
  }

  // 特定の文字数のバリデーションメソッド
  String? validateExactLength(String? value, String fieldName, int exactLength) {
    return FormHelper.validateExactLength(value, fieldName, exactLength);
  }

  // 特定の文字列が含まれているかのバリデーションメソッド
  String? validateContains(String? value, String fieldName, String substring, String errorMessage) {
    return FormHelper.validateContains(value, fieldName, substring, errorMessage);
  }

  @override
  // ウィジェットを構築するメソッド
  Widget build(BuildContext context) {
    return Scaffold(
      // アプリバー
      appBar: AppBar(
        // タイトルを設定
        title: Text(title),
      ),
      // ボディを設定
      body: body,
    );
  }

}