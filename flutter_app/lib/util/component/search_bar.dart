import 'package:flutter/material.dart';

// カスタムサーチバーコンポーネント
class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String) onChanged;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool autofocus;

  // コンストラクタにコメントを追加
  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.backgroundColor,
    this.hintStyle,
    this.textStyle,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: textStyle,
        onChanged: onChanged,
        autofocus: autofocus,
      ),
    );
  }
}