import 'package:flutter/material.dart';

// アラートダイアログコンポーネント
class CustomAlert extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const CustomAlert({super.key, required this.title, required this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: actions,
    );
  }
}
