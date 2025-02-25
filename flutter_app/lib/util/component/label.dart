import 'package:flutter/material.dart';

// ラベルコンポーネント
class LabelComponent extends StatelessWidget {
  // ラベルのテキスト
  final String text;
  // テキストスタイル
  final TextStyle? style;
  // テキストの配置
  final TextAlign? alignment;
  // 最大行数
  final int? maxLines;
  // オーバーフローの処理
  final TextOverflow? overflow;

  const LabelComponent({
    super.key,
    required this.text,
    this.style,
    this.alignment,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
