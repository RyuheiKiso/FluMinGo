import 'package:flutter/material.dart';

// ナビゲーションレールコンポーネント
class NavigationRailComponent extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final bool extended; // ナビゲーションレールが拡張されるかどうか

  // コンストラクタ
  const NavigationRailComponent({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.extended = false, // デフォルトは拡張されない
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      // 現在選択されているインデックス
      selectedIndex: selectedIndex,
      // インデックスが選択されたときのコールバック
      onDestinationSelected: onDestinationSelected,
      // ナビゲーションレールが拡張されるかどうか
      extended: extended,
      // ナビゲーションの目的地
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Tooltip(message: 'ホーム', child: Icon(Icons.home)),
          label: Text('ホーム'),
        ),
        NavigationRailDestination(
          icon: Tooltip(message: '検索', child: Icon(Icons.search)),
          label: Text('検索'),
        ),
        NavigationRailDestination(
          icon: Tooltip(message: 'プロフィール', child: Icon(Icons.person)),
          label: Text('プロフィール'),
        ),
        // 新しい目的地を追加
        NavigationRailDestination(
          icon: Tooltip(message: '設定', child: Icon(Icons.settings)),
          label: Text('設定'),
        ),
      ],
    );
  }
}