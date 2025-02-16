import 'package:flutter/material.dart';

// ディバイダーコンポーネント
class CustomDivider extends StatelessWidget {
  // ディバイダーの色
  final Color color;
  // ディバイダーの太さ
  final double thickness;
  // ディバイダーの余白
  final double indent;
  final double endIndent;

  // コンストラクタ
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
