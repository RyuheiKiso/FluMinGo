import 'package:flutter/material.dart';

// フローティングアクションボタンコンポーネント
class FloatingActionButtonComponent extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingActionButtonComponent({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}