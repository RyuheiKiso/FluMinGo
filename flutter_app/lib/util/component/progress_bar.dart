import 'package:flutter/material.dart';

/// プログレスバーコンポーネント
/// 
/// [ProgressBar]は進行状況を示すためのカスタムプログレスバーウィジェットです。
/// 
/// ```dart
/// ProgressBar(
///   value: 0.5,
/// )
/// ```
class ProgressBar extends StatelessWidget {
  final double value;

  /// コンストラクタ
  /// 
  /// [value] プログレスバーの進行状況（0.0から1.0の範囲）
  const ProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
    );
  }
}
