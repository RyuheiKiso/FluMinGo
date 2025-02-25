import 'package:flutter/material.dart';

// グリッドコンポーネント
class GridComponent extends StatelessWidget {
  // グリッドのアイテム
  final List<Widget> items;
  // クロスアクシスのカウント
  final int crossAxisCount;
  // パディング
  final EdgeInsetsGeometry? padding;
  // スペーシング
  final double spacing;
  // スクロールの収縮
  final bool shrinkWrap;

  const GridComponent({
    super.key,
    required this.items,
    required this.crossAxisCount,
    this.padding,
    this.spacing = 8.0,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        children: items,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        shrinkWrap: shrinkWrap,
      ),
    );
  }
}