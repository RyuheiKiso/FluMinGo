import 'package:flutter/material.dart';

// モーダルコンポーネント
class ModalComponent extends StatelessWidget {
  final Widget content;
  final String title;

  const ModalComponent({super.key, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: <Widget>[
        TextButton(
          child: Text('閉じる'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
