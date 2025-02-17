import 'package:flutter/material.dart';

// リストコンポーネント
class ListComponent extends StatelessWidget {
  // リストのアイテム
  final List<Widget> items;

  const ListComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items,
    );
  }
}