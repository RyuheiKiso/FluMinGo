import 'package:flutter/material.dart';

/// パンくずリストコンポーネント
/// 
/// [Breadcrumb]は、パンくずリストのアイテムを受け取るウィジェットです。
/// 
/// ```dart
/// Breadcrumb(
///   items: [
///     BreadcrumbItem(
///       label: 'Home',
///       isActive: true,
///       onTap: () {
///         print('Home tapped');
///       },
///     ),
///     BreadcrumbItem(
///       label: 'Profile',
///       onTap: () {
///         print('Profile tapped');
///       },
///     ),
///   ],
/// );
/// ```
class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final Color activeColor;
  final Color inactiveColor;

  /// コンストラクタ
  /// 
  /// [items] パンくずリストのアイテム
  /// [activeColor] アクティブなアイテムの色
  /// [inactiveColor] 非アクティブなアイテムの色
  const Breadcrumb({super.key, 
    required this.items,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((item) => _buildItem(item)).toList(),
    );
  }

  Widget _buildItem(BreadcrumbItem item) {
    return Row(
      children: [
        GestureDetector(
          onTap: item.onTap,
          child: Text(
            item.label,
            style: TextStyle(
              color: item.isActive ? activeColor : inactiveColor,
            ),
          ),
        ),
        if (item != items.last) Icon(Icons.chevron_right, color: inactiveColor),
      ],
    );
  }
}

/// パンくずリストのアイテム
class BreadcrumbItem {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  /// コンストラクタ
  /// 
  /// [label] アイテムのラベル
  /// [isActive] アイテムがアクティブかどうか
  /// [onTap] アイテムがタップされたときに呼び出されるコールバック
  BreadcrumbItem({
    required this.label,
    this.isActive = false,
    required this.onTap,
  });
}
