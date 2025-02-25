import 'package:flutter/material.dart';

// カスタムツールチップコンポーネント
class CustomTooltip extends StatelessWidget {
  // ツールチップのメッセージ
  final String message;
  // ツールチップを表示する子ウィジェット
  final Widget child;
  // ツールチップの表示位置
  final TooltipPosition position;
  final double verticalOffset; // 新機能①
  final VoidCallback? onShow; // 新機能②

  const CustomTooltip({
    super.key,
    required this.message,
    required this.child,
    this.position = TooltipPosition.above,
    this.verticalOffset = 24.0, // 新機能①
    this.onShow, // 新機能②
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onShow?.call(); // 新機能②：ツールチップ表示後に呼び出し
    });
    return Tooltip(
      message: message,
      verticalOffset: verticalOffset, // 新機能①
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(color: Colors.white),
      waitDuration: Duration(milliseconds: 500),
      showDuration: Duration(seconds: 2),
      preferBelow: position == TooltipPosition.below,
      child: child,
    );
  }
}

// ツールチップの表示位置を指定するための列挙型
enum TooltipPosition {
  above,
  below,
}