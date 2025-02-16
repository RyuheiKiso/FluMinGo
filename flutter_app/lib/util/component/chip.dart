import 'package:flutter/material.dart';

// チップコンポーネント
class CustomChip extends StatelessWidget {
  // チップに表示するテキスト
  final String label;
  // チップの背景色
  final Color backgroundColor;
  // チップのテキストの色
  final Color textColor;

  // コンストラクタ
  const CustomChip({
    super.key,
    required this.label,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label, // チップに表示するテキスト
        style: TextStyle(
          color: textColor, // テキストの色
        ),
      ),
      backgroundColor: backgroundColor, // チップの背景色
    );
  }
}
