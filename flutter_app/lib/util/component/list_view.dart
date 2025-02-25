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

  // コンストラクタにpaddingとspacingを追加
  const ListViewComponent({
    super.key,
    required this.items,
    this.padding = 8.0,
    this.spacing = 8.0,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ListView.separated(
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
      ),
    );
  }
}