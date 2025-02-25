import 'package:flutter/material.dart';

// リストコンポーネント
class ListComponent extends StatelessWidget {
  // リストのアイテム
  final List<Widget> items;
  // パディング
  final EdgeInsetsGeometry? padding;
  // スクロール方向
  final Axis scrollDirection;
  // スクロールの反転
  final bool reverse;
  // リストの背景色
  final Color? backgroundColor;
  // リストの分割線
  final bool showDividers;
  // リストのスクロールバーの表示
  final bool showScrollbar;

  const ListComponent({
    super.key,
    required this.items,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.backgroundColor,
    this.showDividers = false,
    this.showScrollbar = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget listView = ListView(
      padding: padding,
      scrollDirection: scrollDirection,
      reverse: reverse,
      children: items,
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

    return Container(
      color: backgroundColor,
      child: listView,
    );
  }
}