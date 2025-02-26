import 'package:flutter/material.dart';

// グリッドビューコンポーネント
class GridViewComponent extends StatelessWidget {
  // グリッドのアイテム
  final List<Widget> items;
  // クロスアクシスのカウント
  final int crossAxisCount;
  // パディング
  final double padding;
  // スペーシング
  final double spacing;
  // スクロール方向
  final Axis scrollDirection;
  // スクロールの反転
  final bool reverse;
  // スクロールコントローラー
  final ScrollController? controller;
  // メインアクシスのスペーシング
  final double mainAxisSpacing;
  // クロスアクシスのスペーシング
  final double crossAxisSpacing;
  // スクロールの収縮
  final bool shrinkWrap;
  // グリッドの背景色
  final Color? backgroundColor;
  // グリッドのスクロールバーの表示
  final bool showScrollbar;
  // グリッドの分割線
  final bool showDividers;

  // コンストラクタにpaddingとspacingを追加
  const GridViewComponent({
    super.key,
    required this.items,
    required this.crossAxisCount,
    this.padding = 8.0,
    this.spacing = 8.0,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.mainAxisSpacing = 8.0,
    this.crossAxisSpacing = 8.0,
    this.shrinkWrap = false,
    this.backgroundColor,
    this.showScrollbar = false,
    this.showDividers = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget gridView = GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
      ),
      itemCount: items.length,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      shrinkWrap: shrinkWrap,
      itemBuilder: (context, index) {
        return items[index];
      },
    );

    if (showDividers) {
      gridView = GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
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
