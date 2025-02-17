import 'package:flutter/material.dart';

// リフレッシュインジケーターコンポーネント
class CustomRefreshIndicator extends StatelessWidget {
  // 子ウィジェット
  final Widget child;
  // リフレッシュ時に呼び出されるコールバック
  final Future<void> Function() onRefresh;
  // インジケーターの色
  final Color? color;
  // インジケーターの位置
  final double displacement;
  // インジケーターのストローク幅
  final double strokeWidth;
  // セマンティクスラベル
  final String? semanticsLabel;
  // セマンティクス値
  final String? semanticsValue;
  // エッジパディング
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