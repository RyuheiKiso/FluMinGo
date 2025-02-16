import 'package:flutter/material.dart';

// リストビューコンポーネント
class ListViewComponent extends StatelessWidget {
  final List<Widget> items;

  const ListViewComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: items,
    );
  }
}