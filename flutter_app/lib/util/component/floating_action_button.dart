import 'package:flutter/material.dart';

// フローティングアクションボタンコンポーネント
class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final Color backgroundColor;

  const CustomFloatingActionButton({
    super.key,
    this.icon = Icons.add,
    this.tooltip = 'Increment',
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // ボタンが押されたときの処理
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Floating Action Button Pressed')),
        );
      },
      tooltip: tooltip,
      backgroundColor: backgroundColor,
      child: Icon(icon),
    );
  }
}