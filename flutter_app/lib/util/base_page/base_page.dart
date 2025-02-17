import 'package:flutter/material.dart';
import '../error_handling/error_handler.dart';

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