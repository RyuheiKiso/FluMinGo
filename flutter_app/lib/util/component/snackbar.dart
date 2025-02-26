import 'package:flutter/material.dart';

// カスタムスナックバーコンポーネント
class CustomSnackbar {
  // スナックバーのメッセージ
  final String message;
  CustomSnackbar({required this.message});

  // スナックバーを表示するメソッド
  void show(BuildContext context) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // カスタムスタイルを適用するメソッド
  static void showCustomSnackbar(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
