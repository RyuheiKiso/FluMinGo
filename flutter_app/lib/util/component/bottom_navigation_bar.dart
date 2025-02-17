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
  // 現在のインデックス
  final int currentIndex;
  // タップ時のコールバック
  final ValueChanged<int> onTap;
  // ナビゲーションバーのアイテムリスト
  final List<BottomNavigationBarItem> items;
  // 背景色
  final Color? backgroundColor; // 新しいプロパティ
  // 選択されたアイテムの色
  final Color? selectedItemColor; // 新しいプロパティ
  // 選択されていないアイテムの色
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
    // ボトムナビゲーションバーを返す
    return BottomNavigationBar(
      // 現在のインデックス
      currentIndex: currentIndex,
      // タップ時のコールバック
      onTap: onTap,
      // ナビゲーションバーのアイテムリスト
      items: items,
      // 背景色
      backgroundColor: backgroundColor,
      // 選択されたアイテムの色
      selectedItemColor: selectedItemColor,
      // 選択されていないアイテムの色
      unselectedItemColor: unselectedItemColor,
    );
  }
}