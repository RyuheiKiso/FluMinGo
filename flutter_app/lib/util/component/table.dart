import 'package:flutter/material.dart';

// テーブルコンポーネント
class TableComponent extends StatelessWidget {
  final List<TableRow> rows;
  final TableBorder? border;
  final TableColumnWidth? defaultColumnWidth;
  final TextDirection? textDirection; // 新しいプロパティ
  final TextBaseline? textBaseline; // 新しいプロパティ
  final TableCellVerticalAlignment defaultVerticalAlignment; // 新しいプロパティ
  final EdgeInsetsGeometry? padding; // 新しいプロパティ
  final Color? backgroundColor; // 新しいプロパティ

  const TableComponent({
    super.key,
    required this.rows,
    this.border,
    this.defaultColumnWidth,
    this.textDirection,
    this.textBaseline,
    this.defaultVerticalAlignment = TableCellVerticalAlignment.top, // デフォルト値を設定
    this.padding, // 新しいプロパティ
    this.backgroundColor, // 新しいプロパティ
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor, // 新しいプロパティ
      child: Padding(
        padding: padding ?? EdgeInsets.all(0), // 新しいプロパティ
        child: Table(
          children: rows,
          border: border,
          defaultColumnWidth: defaultColumnWidth ?? const FixedColumnWidth(100.0),
          textDirection: textDirection,
          textBaseline: textBaseline,
          defaultVerticalAlignment: defaultVerticalAlignment,
        ),
      ),
    );
  }
}
