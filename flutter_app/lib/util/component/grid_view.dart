import 'package:flutter/material.dart';

// グリッドビューコンポーネント
class GridViewComponent extends StatelessWidget {
  final List<Widget> items;
  final int crossAxisCount;
  final double padding;
  final double spacing;

  // コンストラクタにpaddingとspacingを追加
  const GridViewComponent({
    super.key,
    required this.items,
    required this.crossAxisCount,
    this.padding = 8.0,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}