import 'package:flutter/material.dart';

// グリッドコンポーネント
class GridComponent extends StatelessWidget {
  // グリッドのアイテム
  final List<Widget> items;
  // クロスアクシスのカウント
  final int crossAxisCount;

  const GridComponent({super.key, required this.items, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      children: items,
    );
  }
}