import 'package:flutter/material.dart';

// カスタムツリービューコンポーネント
class CustomTreeView extends StatelessWidget {
  final List<Widget> children;

  const CustomTreeView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: children,
    );
  }
}
