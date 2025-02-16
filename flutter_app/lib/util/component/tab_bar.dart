import 'package:flutter/material.dart';

// タブバーコンポーネント
class TabBarComponent extends StatelessWidget {
  final List<Tab> tabs;

  const TabBarComponent({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs,
    );
  }
}
