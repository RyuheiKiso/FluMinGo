import 'package:flutter/material.dart';

// タブビューコンポーネント
class TabViewComponent extends StatelessWidget {
  final List<Widget> tabViews;

  const TabViewComponent({super.key, required this.tabViews});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: tabViews,
    );
  }
}
