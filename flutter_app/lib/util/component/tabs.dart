import 'package:flutter/material.dart';

// タブコンポーネント
class TabsComponent extends StatelessWidget {
  // タブのリスト
  final List<Tab> tabs;
  // タブコントローラー
  final TabController? controller;
  // インジケーターの色
  final Color? indicatorColor;
  // ラベルの色
  final Color? labelColor;
  // 選択されていないラベルの色
  final Color? unselectedLabelColor;
  // ラベルのパディング
  final EdgeInsetsGeometry? labelPadding;

  const TabsComponent({
    super.key,
    required this.tabs,
    this.controller,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.labelPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: tabs,
      indicatorColor: indicatorColor,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      labelPadding: labelPadding,
    );
  }
}
