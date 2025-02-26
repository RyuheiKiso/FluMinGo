import 'package:flutter/material.dart';

// ナビゲーションレールコンポーネント
class NavigationRailComponent extends StatelessWidget {
  // 現在選択されているインデックス
  final int selectedIndex;
  // インデックスが選択されたときのコールバック
  final ValueChanged<int> onDestinationSelected;
  // ナビゲーションレールが拡張されるかどうか
  final bool extended;
  // バックグラウンドカラー
  final Color? backgroundColor;
  // ラベルタイプ
  final NavigationRailLabelType? labelType;
  // グループアライメント
  final double? groupAlignment;
  // アイコンのサイズ
  final double iconSize;
  // アイコンの色
  final Color? iconColor;
  // ラベルのスタイル
  final TextStyle? labelStyle;

  // コンストラクタ
  const NavigationRailComponent({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.extended = false,
    this.backgroundColor,
    this.labelType,
    this.groupAlignment,
    this.iconSize = 24.0,
    this.iconColor,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      extended: extended,
      backgroundColor: backgroundColor,
      labelType: labelType,
      groupAlignment: groupAlignment,
      destinations: [
        // ホームの目的地
        NavigationRailDestination(
          icon: Tooltip(
            message: 'ホーム',
            child: Icon(Icons.home, size: iconSize, color: iconColor),
          ),
          label: Text('ホーム', style: labelStyle),
        ),
        // 検索の目的地
        NavigationRailDestination(
          icon: Tooltip(
            message: '検索',
            child: Icon(Icons.search, size: iconSize, color: iconColor),
          ),
          label: Text('検索', style: labelStyle),
        ),
        // プロフィールの目的地
        NavigationRailDestination(
          icon: Tooltip(
            message: 'プロフィール',
            child: Icon(Icons.person, size: iconSize, color: iconColor),
          ),
          label: Text('プロフィール', style: labelStyle),
        ),
        // 設定の目的地
        NavigationRailDestination(
          icon: Tooltip(
            message: '設定',
            child: Icon(Icons.settings, size: iconSize, color: iconColor),
          ),
          label: Text('設定', style: labelStyle),
        ),
      ],
    );
  }
}
