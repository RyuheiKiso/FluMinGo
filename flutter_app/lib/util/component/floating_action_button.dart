import 'package:flutter/material.dart';

// フローティングアクションボタンコンポーネント
class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // ボタンが押されたときの処理
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Floating Action Button Pressed')),
        );
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}