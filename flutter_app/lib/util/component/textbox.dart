import 'package:flutter/material.dart';

// テキストボックスコンポーネント
class TextboxComponent extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText; // 新しいプロパティ
  final TextInputType keyboardType; // 新しいプロパティ
  final int? maxLength; // 新しいプロパティ
  final TextStyle? style; // 新しいプロパティ

  const TextboxComponent({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false, // デフォルト値を設定
    this.keyboardType = TextInputType.text, // デフォルト値を設定
    this.maxLength, // 新しいプロパティ
    this.style, // 新しいプロパティ
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: maxLength != null ? '' : null, // 新しいプロパティ
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength, // 新しいプロパティ
      style: style, // 新しいプロパティ
    );
  }
}
