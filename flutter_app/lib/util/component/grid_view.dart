import 'package:flutter/material.dart';

// グリッドビューコンポーネント
class GridViewComponent extends StatelessWidget {
  final List<Widget> items;
  final int crossAxisCount;

  const GridViewComponent({super.key, required this.items, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: items,
    );
  }
}