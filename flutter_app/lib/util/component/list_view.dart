import 'package:flutter/material.dart';

// リストビューコンポーネント
class ListViewComponent extends StatelessWidget {
  // リストのアイテム
  final List<Widget> items;
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
  // リストの背景色
  final Color? backgroundColor;
  // リストの分割線
  final bool showDividers;
  // リストのスクロールバーの表示
  final bool showScrollbar;

  // コンストラクタにpaddingとspacingを追加
  const ListViewComponent({
    super.key,
    required this.items,
    this.padding = 8.0,
    this.spacing = 8.0,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.backgroundColor,
    this.showDividers = false,
    this.showScrollbar = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget listView = ListView.separated(
      itemCount: items.length,
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      itemBuilder: (context, index) {
        return items[index];
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing);
      },
    );

    if (showDividers) {
      listView = ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) => items[index],
        separatorBuilder: (context, index) => Divider(),
      );
    }

    if (showScrollbar) {
      listView = Scrollbar(child: listView);
    }

    return Container(color: backgroundColor, child: listView);
  }
}
