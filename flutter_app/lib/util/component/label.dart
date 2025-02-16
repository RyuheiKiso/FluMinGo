import 'package:flutter/material.dart';

// ラベルコンポーネント
class Label extends StatelessWidget {
  final String text;

  // コンストラクタ。textパラメータは必須。
  const Label({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // Textウィジェットを返す。フォントサイズは16。
    return Text(
      text,
      style: TextStyle(fontSize: 16),
    );
  }
}
