import 'package:flutter/material.dart';

// 概要: テキストボックスコンポーネント
// 目的: テキスト入力フィールドを提供する
// 使用方法: TextboxComponent(controller: TextEditingController(), hintText: 'ヒントテキスト')

// テキストボックスコンポーネント
class TextboxComponent extends StatelessWidget {
  // テキスト編集コントローラー
  final TextEditingController controller;
  // ヒントテキスト
  final String? hintText;
  // テキストを隠すかどうか
  final bool obscureText;
  // キーボードタイプ
  final TextInputType keyboardType;
  // 最大文字数
  final int? maxLength;
  // テキストスタイル
  final TextStyle? style;

  const TextboxComponent({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: maxLength != null ? '' : null,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: style,
    );
  }
}
