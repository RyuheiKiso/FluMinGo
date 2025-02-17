import 'package:flutter/material.dart';

/// ボタンコンポーネント
/// 
/// [Button]は、ラベルと押下時のコールバックを受け取るシンプルなボタンウィジェットです。
/// 
/// ```dart
/// Button(
///   label: 'Click me',
///   onPressed: () {
///     print('Button pressed');
///   },
/// );
/// ```
class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  /// コンストラクタ
  /// 
  /// [label] ボタンに表示するテキスト
  /// [onPressed] ボタンが押されたときに呼び出されるコールバック
  const Button({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
