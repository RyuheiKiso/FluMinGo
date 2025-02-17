import 'package:flutter/material.dart';

// リフレッシュインジケーターコンポーネント
class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;
  final double displacement;
  final double strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
  final EdgeInsetsGeometry? edgePadding;

  // コンストラクタにコメントを追加
  const CustomRefreshIndicator({
    Key? key,
    required this.child,
    required this.onRefresh,
    this.color,
    this.displacement = 40.0,
    this.strokeWidth = 2.0,
    this.semanticsLabel,
    this.semanticsValue,
    this.edgePadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: color,
      displacement: displacement,
      strokeWidth: strokeWidth,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      child: child,
    );
  }
}