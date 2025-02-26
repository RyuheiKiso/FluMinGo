import 'package:flutter/material.dart';

// テーブルコンポーネント
class TableComponent extends StatelessWidget {
  // テーブル行のリスト
  final List<TableRow> rows;
  // テーブルのボーダー
  final TableBorder? border;
  // デフォルトの列幅
  final TableColumnWidth? defaultColumnWidth;
  // テキストの方向
  final TextDirection? textDirection;
  // テキストのベースライン
  final TextBaseline? textBaseline;
  // デフォルトの垂直アライメント
  final TableCellVerticalAlignment defaultVerticalAlignment;
  // パディング
  final EdgeInsetsGeometry? padding;
  // 背景色
  final Color? backgroundColor;

  const TableComponent({
    super.key,
    required this.rows,
    this.border,
    this.defaultColumnWidth,
    this.textDirection,
    this.textBaseline,
    this.defaultVerticalAlignment = TableCellVerticalAlignment.top,
    this.padding,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: padding ?? EdgeInsets.all(0),
        child: Table(
          children: rows,
          border: border,
          defaultColumnWidth:
              defaultColumnWidth ?? const FixedColumnWidth(100.0),
          textDirection: textDirection,
          textBaseline: textBaseline,
          defaultVerticalAlignment: defaultVerticalAlignment,
        ),
      ),
    );
  }
}
