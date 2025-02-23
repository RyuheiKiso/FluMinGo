import 'package:flutter/material.dart';

// カスタムサーチバーコンポーネント
class CustomSearchBar extends StatelessWidget {
  // テキスト編集コントローラー
  final TextEditingController controller;
  // ヒントテキスト
  final String hintText;
  // テキストが変更されたときのコールバック
  final void Function(String) onChanged;
  // バックグラウンドカラー
  final Color? backgroundColor;
  // ヒントテキストのスタイル
  final TextStyle? hintStyle;
  // テキストのスタイル
  final TextStyle? textStyle;
  // 自動フォーカス
  final bool autofocus;

  // コンストラクタにコメントを追加
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.backgroundColor,
    this.hintStyle,
    this.textStyle,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // バックグラウンドカラー
      color: backgroundColor,
      child: TextField(
        // テキスト編集コントローラー
        controller: controller,
        decoration: InputDecoration(
          // ヒントテキスト
          hintText: hintText,
          // ヒントテキストのスタイル
          hintStyle: hintStyle,
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        // テキストのスタイル
        style: textStyle,
        // テキストが変更されたときのコールバック
        onChanged: onChanged,
        // 自動フォーカス
        autofocus: autofocus,
      ),
    );
  }
}