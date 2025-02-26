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
  // テキストの背景色
  final Color? backgroundColor;
  // テキストの装飾
  final TextDecoration? decoration;
  // テキストの影
  final List<Shadow>? shadows;

  const LabelComponent({
    super.key,
    required this.text,
    this.style,
    this.alignment,
    this.maxLines,
    this.overflow,
    this.backgroundColor,
    this.decoration,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Text(
        text,
        style: style?.copyWith(decoration: decoration, shadows: shadows),
        textAlign: alignment,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}
