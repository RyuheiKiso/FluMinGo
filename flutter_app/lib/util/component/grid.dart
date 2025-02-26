import 'package:flutter/material.dart';

// 概要: グリッドコンポーネント
// 目的: グリッド表示を簡単にするためのコンポーネント
// 使用方法: GridComponent(items: [Widget1, Widget2, ...], crossAxisCount: 2)

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
  // グリッドの背景色
  final Color? backgroundColor;
  // グリッドのスクロールバーの表示
  final bool showScrollbar;
  // グリッドの分割線
  final bool showDividers;

  const GridComponent({
    super.key,
    required this.items,
    required this.crossAxisCount,
    this.padding,
    this.spacing = 8.0,
    this.shrinkWrap = false,
    this.backgroundColor,
    this.showScrollbar = false,
    this.showDividers = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget gridView = GridView.count(
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      shrinkWrap: shrinkWrap,
      children: items,
    );

    if (showDividers) {
      gridView = GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
      );
    }

    if (showScrollbar) {
      gridView = Scrollbar(child: gridView);
    }

    return Container(color: backgroundColor, child: gridView);
  }
}
