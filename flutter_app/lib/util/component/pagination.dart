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
  // ページ番号の表示スタイル
  final TextStyle? pageNumberStyle;
  // ページボタンのアイコンサイズ
  final double iconSize;
  // ページボタンの色
  final Color? buttonColor;

  // コンストラクタ
  const PaginationComponent({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.showFirstLastButtons = false,
    this.firstPageIcon = Icons.first_page,
    this.lastPageIcon = Icons.last_page,
    this.pageNumberStyle,
    this.iconSize = 24.0,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (showFirstLastButtons)
          IconButton(
            icon: Icon(firstPageIcon, size: iconSize, color: buttonColor),
            onPressed: currentPage > 1 ? () => onPageChanged(1) : null,
          ),
        // 前のページボタン
        IconButton(
          icon: Icon(Icons.arrow_back, size: iconSize, color: buttonColor),
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        // ページ番号表示
        Text('$currentPage / $totalPages', style: pageNumberStyle),
        // 次のページボタン
        IconButton(
          icon: Icon(Icons.arrow_forward, size: iconSize, color: buttonColor),
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
        ),
        if (showFirstLastButtons)
          IconButton(
            icon: Icon(lastPageIcon, size: iconSize, color: buttonColor),
            onPressed: currentPage < totalPages ? () => onPageChanged(totalPages) : null,
          ),
      ],
    );
  }
}
