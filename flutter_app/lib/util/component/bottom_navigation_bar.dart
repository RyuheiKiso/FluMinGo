import 'package:flutter/material.dart';

/// ボトムナビゲーションバーコンポーネント
/// 
/// [BottomNavigationBarComponent]は、現在のインデックスとタップ時のコールバックを受け取るシンプルなボトムナビゲーションバーウィジェットです。
/// 
/// ```dart
/// BottomNavigationBarComponent(
///   currentIndex: 0,
///   onTap: (index) {
///     print('Selected index: $index');
///   },
///   items: [
///     BottomNavigationBarItem(
///       icon: Icon(Icons.home),
///       label: 'Home',
///     ),
///     BottomNavigationBarItem(
///       icon: Icon(Icons.search),
///       label: 'Search',
///     ),
///   ],
///   backgroundColor: Colors.blue, // 背景色を追加
///   selectedItemColor: Colors.white, // 選択されたアイテムの色を追加
///   unselectedItemColor: Colors.grey, // 選択されていないアイテムの色を追加
/// );
/// ```
class BottomNavigationBarComponent extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color? backgroundColor; // 新しいプロパティ
  final Color? selectedItemColor; // 新しいプロパティ
  final Color? unselectedItemColor; // 新しいプロパティ

  /// コンストラクタ
  /// 
  /// [currentIndex] 現在選択されているインデックス
  /// [onTap] インデックスがタップされたときに呼び出されるコールバック
  /// [items] ナビゲーションバーのアイテムリスト
  /// [backgroundColor] ナビゲーションバーの背景色
  /// [selectedItemColor] 選択されたアイテムの色
  /// [unselectedItemColor] 選択されていないアイテムの色
  const BottomNavigationBarComponent({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      backgroundColor: backgroundColor,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
    );
  }
}