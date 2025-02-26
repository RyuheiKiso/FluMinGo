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
  // パンクズリストのアイテム
  final List<BreadcrumbItem> items;
  // アクティブなアイテムの色
  final Color activeColor;
  // 非アクティブなアイテムの色
  final Color inactiveColor;
  // アイテム間のセパレーターアイコン
  final IconData? separatorIcon;
  // アイテム間の間隔
  final double spacing;
  // フォントサイズ
  final double? fontSize;
  // フォントの太さ
  final FontWeight? fontWeight;

  /// コンストラクタ
  ///
  /// [items] パンクズリストのアイテム
  /// [activeColor] アクティブなアイテムの色
  /// [inactiveColor] 非アクティブなアイテムの色
  /// [separatorIcon] アイテム間のセパレーターアイコン
  /// [spacing] アイテム間の間隔
  const Breadcrumb({
    super.key,
    required this.items,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.separatorIcon = Icons.chevron_right,
    this.spacing = 8.0,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // アイテムをビルド
      children: items.map((item) => _buildItem(item)).toList(),
    );
  }

  Widget _buildItem(BreadcrumbItem item) {
    return Row(
      children: [
        GestureDetector(
          // アイテムがタップされたときの処理
          onTap: item.onTap,
          child: Row(
            children: [
              // アイコンがある場合は表示
              if (item.icon != null)
                Icon(
                  item.icon,
                  color: item.isActive ? activeColor : inactiveColor,
                ),
              // ツールチップがある場合は表示
              if (item.tooltip != null)
                Tooltip(
                  message: item.tooltip!,
                  child: Text(
                    item.label,
                    style: TextStyle(
                      color: item.isActive ? activeColor : inactiveColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                )
              else
                Text(
                  item.label,
                  style: TextStyle(
                    color: item.isActive ? activeColor : inactiveColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                ),
            ],
          ),
        ),
        // 最後のアイテムでない場合はセパレーターアイコンを表示
        if (item != items.last) Icon(separatorIcon, color: inactiveColor),
        // アイテム間の間隔を設定
        SizedBox(width: spacing),
      ],
    );
  }
}

/// パンクズリストのアイテム
class BreadcrumbItem {
  // アイテムのラベル
  final String label;
  // アイテムがアクティブかどうか
  final bool isActive;
  // アイテムがタップされたときに呼び出されるコールバック
  final VoidCallback onTap;
  // アイテムのアイコン
  final IconData? icon;
  // アイテムのツールチップ
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
