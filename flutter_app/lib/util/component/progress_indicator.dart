import 'package:flutter/material.dart';

// プログレスインジケーターコンポーネント
class ProgressIndicatorComponent extends StatelessWidget {
  final double value;
  final Color color; // カスタムカラー
  final double size; // カスタムサイズ
  final bool isAnimated; // アニメーションの有効/無効
  final double strokeWidth; // カスタムストローク幅
  final String? tooltip; // ツールチップ

  const ProgressIndicatorComponent({
    super.key,
    required this.value,
    this.color = Colors.blue, // デフォルトカラー
    this.size = 50.0, // デフォルトサイズ
    this.isAnimated = true, // デフォルトでアニメーション有効
    this.strokeWidth = 4.0, // デフォルトストローク幅
    this.tooltip,
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
          strokeWidth: isAnimated ? strokeWidth : 0.0, // アニメーション無効時のストローク幅
        ),
      ),
    );
  }
}
