import 'package:flutter/material.dart';

// リフレッシュインジケーターコンポーネント
class RefreshIndicatorComponent extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const RefreshIndicatorComponent({super.key, required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }
}