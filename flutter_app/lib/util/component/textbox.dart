import 'package:flutter/material.dart';

// テキストボックスコンポーネント
class TextBox extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const TextBox({super.key, required this.label, required this.controller, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
