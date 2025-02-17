import 'package:flutter/material.dart';

/// カードコンポーネント
/// 
/// [CardComponent]は子ウィジェットを受け取るカスタムカードウィジェットです。
/// 
/// ```dart
/// CardComponent(
///   child: Text('This is a card'),
/// )
/// ```
class CardComponent extends StatelessWidget {
  final Widget child;

  /// コンストラクタ
  /// 
  /// [child] カード内に表示するウィジェット
  const CardComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}