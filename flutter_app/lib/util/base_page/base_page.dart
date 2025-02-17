import 'package:flutter/material.dart';
import '../error_handling/error_handler.dart';

// ベースページクラス
class BasePage extends StatelessWidget {
  final String title;
  final Widget body;

  const BasePage({super.key, required this.title, required this.body});

  void showError(BuildContext context, String message) {
    ErrorHandler.showError(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }

}