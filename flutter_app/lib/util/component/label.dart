import 'package:flutter/material.dart';

// ラベルコンポーネント
class LabelComponent extends StatelessWidget {
  final String text;
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
