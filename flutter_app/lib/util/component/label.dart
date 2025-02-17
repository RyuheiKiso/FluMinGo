import 'package:flutter/material.dart';

// ラベルコンポーネント
class LabelComponent extends StatelessWidget {
  // ラベルのテキスト
  final String text;
  // テキストスタイル
  final TextStyle? style;

  const LabelComponent({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
