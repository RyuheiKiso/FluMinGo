import 'package:flutter/material.dart';

// カスタムツールチップコンポーネント
class CustomTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final TooltipPosition position;

  CustomTooltip({required this.message, required this.child, this.position = TooltipPosition.above});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: child,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(color: Colors.white),
      waitDuration: Duration(milliseconds: 500),
      showDuration: Duration(seconds: 2),
      preferBelow: position == TooltipPosition.below,
    );
  }
}

// ツールチップの表示位置を指定するための列挙型
enum TooltipPosition {
  above,
  below,
}