import 'package:flutter/material.dart';

// カードコンポーネント
class CardComponent extends StatelessWidget {
  final Widget child;

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