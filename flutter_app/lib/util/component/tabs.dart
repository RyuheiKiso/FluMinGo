import 'package:flutter/material.dart';

// タブコンポーネント
class CustomTabs extends StatelessWidget {
  final List<Tab> tabs;
  final TabController controller;

  const CustomTabs({super.key, required this.tabs, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: tabs,
    );
  }
}
