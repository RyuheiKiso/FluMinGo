import 'package:flutter/material.dart';

/// プログレスバーコンポーネント
/// 
/// [ProgressBarComponent]は進行状況を示すためのカスタムプログレスバーウィジェットです。
/// 
/// ```dart
/// ProgressBarComponent(
///   progress: 0.5,
///   color: Colors.red,
/// )
/// ```
class ProgressBarComponent extends StatelessWidget {
  // 進捗率 (0.0 - 1.0)
  final double progress;
  // プログレスバーの色
  final Color color;
  // バックグラウンドカラー
  final Color? backgroundColor;
  // プログレスバーの最小高さ
  final double? minHeight;
  // セマンティクスラベル
  final String? semanticsLabel;

  /// コンストラクタ
  /// 
  /// [progress] プログレスバーの進行状況（0.0から1.0の範囲）
  /// [color] プログレスバーの色（デフォルトは青）
  const ProgressBarComponent({
    super.key,
    required this.progress,
    this.color = Colors.blue,
    this.backgroundColor,
    this.minHeight,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      valueColor: AlwaysStoppedAnimation<Color>(color),
      backgroundColor: backgroundColor ?? color.withOpacity(0.3),
      minHeight: minHeight,
      semanticsLabel: semanticsLabel,
    );
  }
}
