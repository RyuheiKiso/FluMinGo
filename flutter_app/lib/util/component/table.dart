import 'package:flutter/material.dart';

// テーブルコンポーネント
class TableComponent extends StatelessWidget {
  final List<TableRow> rows;

  const TableComponent({super.key, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: rows,
    );
  }
}
