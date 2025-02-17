import 'package:flutter/material.dart';

// タブコンポーネント
class TabsComponent extends StatelessWidget {
  final List<Tab> tabs;
  final TabController? controller;
  final Color? indicatorColor; // 新しいプロパティ
  final Color? labelColor; // 新しいプロパティ
  final Color? unselectedLabelColor; // 新しいプロパティ
  final EdgeInsetsGeometry? labelPadding; // 新しいプロパティ

  const TabsComponent({
    super.key,
    required this.tabs,
    this.controller,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor, // 新しいプロパティ
    this.labelPadding, // 新しいプロパティ
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: tabs,
      indicatorColor: indicatorColor,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor, // 新しいプロパティ
      labelPadding: labelPadding, // 新しいプロパティ
    );
  }
}
