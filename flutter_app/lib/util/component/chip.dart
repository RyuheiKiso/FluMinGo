import 'package:flutter/material.dart';

/// チップコンポーネント
/// 
/// [CustomChip]はテキスト、背景色、およびテキストの色を受け取るカスタムチップウィジェットです。
/// 
/// ```dart
/// CustomChip(
///   label: 'Example',
///   backgroundColor: Colors.blue,
///   textColor: Colors.white,
/// )
/// ```
class CustomChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  /// コンストラクタ
  /// 
  /// [label] チップに表示するテキスト
  /// [backgroundColor] チップの背景色
  /// [textColor] チップのテキストの色
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
        label,
        style: TextStyle(
          color: textColor,
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
