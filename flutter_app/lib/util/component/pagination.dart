import 'package:flutter/material.dart';

// ページネーションコンポーネント
class PaginationComponent extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;

  // コンストラクタ
  const PaginationComponent({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 前のページボタン
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        // ページ番号表示
        Text('$currentPage / $totalPages'),
        // 次のページボタン
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
        ),
      ],
    );
  }
}
