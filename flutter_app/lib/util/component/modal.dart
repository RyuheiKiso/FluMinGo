import 'package:flutter/material.dart';

// モーダルダイアログコンポーネント
class Modal extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;

  const Modal({super.key, required this.title, required this.content, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onConfirm,
          child: Text('確認'),
        ),
      ],
    );
  }
}
