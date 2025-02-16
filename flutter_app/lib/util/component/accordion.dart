import 'package:flutter/material.dart';

// アコーディオンコンポーネント
class Accordion extends StatelessWidget {
  final String title;
  final Widget content;

  const Accordion({required this.title, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [content],
    );
  }
}
