import 'package:flutter/material.dart';

// リストビューコンポーネント
class ListViewComponent extends StatelessWidget {
  // リストのアイテム
  final List<Widget> items;
  // パディング
  final double padding;
  // スペーシング
  final double spacing;

  // コンストラクタにpaddingとspacingを追加
  const ListViewComponent({
    super.key,
    required this.items,
    this.padding = 8.0,
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ListView.separated(
        itemCount: items.length,
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