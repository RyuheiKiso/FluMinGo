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

  const ListComponent({
    super.key,
    required this.items,
    this.padding,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      scrollDirection: scrollDirection,
      reverse: reverse,
      children: items,
    );
  }
}