import 'package:flutter/material.dart';

// ボタンコンポーネント
class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const Button({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
