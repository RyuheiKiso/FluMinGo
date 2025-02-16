import 'package:flutter/material.dart';

// ツールチップコンポーネント
class TooltipComponent extends StatelessWidget {
  final String message;
  final Widget child;

  const TooltipComponent({super.key, required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: child,
    );
  }
}