import 'package:flutter/material.dart';

// モーダルコンポーネント
class ModalComponent extends StatelessWidget {
  // モーダルのコンテンツ
  final Widget content;
  // モーダルのタイトル
  final String title;

  const ModalComponent({super.key, required this.content, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // タイトルの表示
      title: Text(title),
      // コンテンツの表示
      content: content,
      actions: <Widget>[
        // 閉じるボタン
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
