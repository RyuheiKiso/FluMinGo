import 'package:flutter/material.dart';

// 概要: タブビューコンポーネント
// 目的: タブと対応するビューを提供する
// 使用方法: TabViewComponent(tabs: [Tab(text: 'タブ1')], views: [Text('ビュー1')])

// タブビューコンポーネント
class TabViewComponent extends StatelessWidget {
  // タブのリスト
  final List<Widget> tabs;
  // ビューのリスト
  final List<Widget> views;
  // タブコントローラー
  final TabController? controller;
  // スクロール可能かどうか
  final bool isScrollable;
  // インジケーターの色
  final Color? indicatorColor;
  // ラベルの色
  final Color? labelColor;
  // 選択されていないラベルの色
  final Color? unselectedLabelColor;

  const TabViewComponent({
    super.key,
    required this.tabs,
    required this.views,
    this.controller,
    this.isScrollable = false,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
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
            indicatorColor: indicatorColor,
            labelColor: labelColor,
            unselectedLabelColor: unselectedLabelColor,
          ),
          Expanded(child: TabBarView(controller: controller, children: views)),
        ],
      ),
    );
  }
}
