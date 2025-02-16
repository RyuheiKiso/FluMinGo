import 'package:flutter/material.dart';

// ナビゲーションレールコンポーネント
class NavigationRailComponent extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationRailComponent({super.key, required this.selectedIndex, required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('ホーム'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search),
          label: Text('検索'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person),
          label: Text('プロフィール'),
        ),
      ],
    );
  }
}