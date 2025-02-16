import 'package:flutter/material.dart';

// ボトムナビゲーションバーコンポーネント
class BottomNavigationBarComponent extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarComponent({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '検索',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'プロフィール',
        ),
      ],
    );
  }
}