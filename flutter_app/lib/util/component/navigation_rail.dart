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

  // コンストラクタ
  const NavigationRailComponent({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.extended = false,
    this.backgroundColor,
    this.labelType,
    this.groupAlignment,
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
      destinations: const <NavigationRailDestination>[
        // ホームの目的地
        NavigationRailDestination(
          icon: Tooltip(message: 'ホーム', child: Icon(Icons.home)),
          label: Text('ホーム'),
        ),
        // 検索の目的地
        NavigationRailDestination(
          icon: Tooltip(message: '検索', child: Icon(Icons.search)),
          label: Text('検索'),
        ),
        // プロフィールの目的地
        NavigationRailDestination(
          icon: Tooltip(message: 'プロフィール', child: Icon(Icons.person)),
          label: Text('プロフィール'),
        ),
        // 設定の目的地
        NavigationRailDestination(
          icon: Tooltip(message: '設定', child: Icon(Icons.settings)),
          label: Text('設定'),
        ),
      ],
    );
  }
}