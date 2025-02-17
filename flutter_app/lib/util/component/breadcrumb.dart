import 'package:flutter/material.dart';

/// パンクズリストコンポーネント
/// 
/// [Breadcrumb]は、パンクズリストのアイテムを受け取るウィジェットです。
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
///       tooltip: 'Go to Home',
///     ),
///     BreadcrumbItem(
///       label: 'Profile',
///       onTap: () {
///         print('Profile tapped');
///       },
///       tooltip: 'Go to Profile',
///     ),
///   ],
///   spacing: 8.0,
///   separatorIcon: Icons.arrow_forward,
/// );
/// ```
class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final Color activeColor;
  final Color inactiveColor;
  final IconData? separatorIcon;
  final double spacing;

  /// コンストラクタ
  /// 
  /// [items] パンクズリストのアイテム
  /// [activeColor] アクティブなアイテムの色
  /// [inactiveColor] 非アクティブなアイテムの色
  /// [separatorIcon] アイテム間のセパレーターアイコン
  /// [spacing] アイテム間の間隔
  const Breadcrumb({super.key, 
    required this.items,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.separatorIcon = Icons.chevron_right,
    this.spacing = 8.0,
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
          child: Row(
            children: [
              if (item.icon != null) Icon(item.icon, color: item.isActive ? activeColor : inactiveColor),
              if (item.tooltip != null)
                Tooltip(
                  message: item.tooltip!,
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color: item.isActive ? activeColor : inactiveColor,
                    ),
                  ),
                )
              else
                Text(
                  item.label,
                  style: TextStyle(
                    color: item.isActive ? activeColor : inactiveColor,
                  ),
                ),
            ],
          ),
        ),
        if (item != items.last) Icon(separatorIcon, color: inactiveColor),
        SizedBox(width: spacing),
      ],
    );
  }
}

/// パンクズリストのアイテム
class BreadcrumbItem {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final IconData? icon;
  final String? tooltip;

  /// コンストラクタ
  /// 
  /// [label] アイテムのラベル
  /// [isActive] アイテムがアクティブかどうか
  /// [onTap] アイテムがタップされたときに呼び出されるコールバック
  /// [icon] アイテムのアイコン
  /// [tooltip] アイテムのツールチップ
  BreadcrumbItem({
    required this.label,
    this.isActive = false,
    required this.onTap,
    this.icon,
    this.tooltip,
  });
}
