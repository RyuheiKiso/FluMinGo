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
  final double progress; // 進捗率 (0.0 - 1.0)
  final Color color;

  /// コンストラクタ
  /// 
  /// [progress] プログレスバーの進行状況（0.0から1.0の範囲）
  /// [color] プログレスバーの色（デフォルトは青）
  const ProgressBarComponent({super.key, required this.progress, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress, // 進捗率を設定
      valueColor: AlwaysStoppedAnimation<Color>(color), // プログレスバーの色
      backgroundColor: color.withOpacity(0.3), // 背景色
    );
  }
}
