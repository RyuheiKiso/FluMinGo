import 'package:flutter/material.dart';

// ディバイダーコンポーネント
// 概要: 区切り線を表示するためのコンポーネント
// 目的: UI要素間の視覚的な区切りを提供する
// 使用方法: CustomDivider(color: Colors.grey, thickness: 2.0);
class CustomDivider extends StatelessWidget {
  // ディバイダーの色
  final Color color;
  // ディバイダーの太さ
  final double thickness;
  // ディバイダーの余白
  final double indent;
  final double endIndent;

  // コンストラクタにコメントを追加
  const CustomDivider({
    super.key,
    this.color = Colors.black,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color, // ディバイダーの色
      thickness: thickness, // ディバイダーの太さ
      indent: indent, // ディバイダーの始まりの余白
      endIndent: endIndent, // ディバイダーの終わりの余白
    );
  }
}
