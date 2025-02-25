import 'package:flutter/material.dart';

// プログレスインジケーターコンポーネント
class ProgressIndicatorComponent extends StatelessWidget {
  // プログレスの値
  final double value;
  // カスタムカラー
  final Color color; 
  // カスタムサイズ
  final double size; 
  // アニメーションの有効/無効
  final bool isAnimated; 
  // カスタムストローク幅
  final double strokeWidth; 
  // ツールチップ
  final String? tooltip; 
  // バックグラウンドカラー
  final Color? backgroundColor;
  // プログレスインジケーターの色
  final Animation<Color?>? valueColor;
  // セマンティクスラベル
  final String? semanticsLabel;
  // プログレスインジケーターの形状
  final ShapeBorder? shape;
  // プログレスインジケーターのアニメーションの持続時間
  final Duration? animationDuration;
  // プログレスインジケーターのトリガー距離
  final double triggerDistance;

  const ProgressIndicatorComponent({
    super.key,
    required this.value,
    this.color = Colors.blue, 
    this.size = 50.0, 
    this.isAnimated = true, 
    this.strokeWidth = 4.0, 
    this.tooltip,
    this.backgroundColor,
    this.valueColor,
    this.semanticsLabel,
    this.shape,
    this.animationDuration,
    this.triggerDistance = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Tooltip(
        message: tooltip ?? '',
        child: CircularProgressIndicator(
          value: value,
          color: color,
          strokeWidth: isAnimated ? strokeWidth : 0.0, 
          backgroundColor: backgroundColor,
          valueColor: valueColor,
          semanticsLabel: semanticsLabel,
        ),
      ),
    );
  }
}
