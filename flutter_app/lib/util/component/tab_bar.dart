import 'package:flutter/material.dart';

// 概要: カスタムタブバーコンポーネント
// 目的: カスタムタブバーを提供する
// 使用方法: CustomTabBar(tabs: [Tab(text: 'タブ1')], controller: TabController(length: 1, vsync: this))

// カスタムタブバーコンポーネント
class CustomTabBar extends StatelessWidget {
  // タブのリスト
  final List<Tab> tabs;
  // タブコントローラー
  final TabController controller;
  // インジケーターの色
  final Color indicatorColor;
  // 選択されたタブのラベルの色
  final Color labelColor;
  // 選択されていないタブのラベルの色
  final Color unselectedLabelColor;
  // タブがスクロール可能かどうか
  final bool isScrollable;
  // タブのアイコンリスト
  final List<IconData>? icons;

  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.controller,
    this.indicatorColor = Colors.blue,
    this.labelColor = Colors.black,
    this.unselectedLabelColor = Colors.grey,
    this.isScrollable = false,
    this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: List.generate(tabs.length, (index) {
        // タブのテキストとアイコンを設定
        return Tab(
          text: tabs[index].text,
          icon: icons != null ? Icon(icons![index]) : null,
        );
      }),
      indicatorColor: indicatorColor,
      labelColor: labelColor,
      unselectedLabelColor: unselectedLabelColor,
      isScrollable: isScrollable,
    );
  }
}
