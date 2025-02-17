import 'package:flutter/material.dart';

// タブビューコンポーネント
class TabViewComponent extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> views;
  final TabController? controller;
  final bool isScrollable; // 新しいプロパティ
  final Color? indicatorColor; // 新しいプロパティ
  final Color? labelColor; // 新しいプロパティ
  final Color? unselectedLabelColor; // 新しいプロパティ

  const TabViewComponent({
    super.key,
    required this.tabs,
    required this.views,
    this.controller,
    this.isScrollable = false, // デフォルト値を設定
    this.indicatorColor, // 新しいプロパティ
    this.labelColor, // 新しいプロパティ
    this.unselectedLabelColor, // 新しいプロパティ
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            controller: controller,
            tabs: tabs,
            isScrollable: isScrollable,
            indicatorColor: indicatorColor, // 新しいプロパティ
            labelColor: labelColor, // 新しいプロパティ
            unselectedLabelColor: unselectedLabelColor, // 新しいプロパティ
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: views,
            ),
          ),
        ],
      ),
    );
  }
}
