import 'package:flutter/material.dart';

// ページネーションコンポーネント
class PaginationComponent extends StatelessWidget {
  // 現在のページ
  final int currentPage;
  // 総ページ数
  final int totalPages;
  // ページ変更コールバック
  final ValueChanged<int> onPageChanged;
  // 最初と最後のボタンを表示するかどうか
  final bool showFirstLastButtons;
  // 最初のページアイコン
  final IconData firstPageIcon;
  // 最後のページアイコン
  final IconData lastPageIcon;

  // コンストラクタ
  const PaginationComponent({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.showFirstLastButtons = false,
    this.firstPageIcon = Icons.first_page,
    this.lastPageIcon = Icons.last_page,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showFirstLastButtons)
          IconButton(
            icon: Icon(firstPageIcon),
            onPressed: currentPage > 1 ? () => onPageChanged(1) : null,
          ),
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
        if (showFirstLastButtons)
          IconButton(
            icon: Icon(lastPageIcon),
            onPressed: currentPage < totalPages ? () => onPageChanged(totalPages) : null,
          ),
      ],
    );
  }
}
