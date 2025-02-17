import 'package:flutter/material.dart';

// カスタムタブバーコンポーネント
class CustomTabBar extends StatelessWidget {
  final List<Tab> tabs; // タブのリスト
  final TabController controller; // タブコントローラー
  final Color indicatorColor; // インジケーターの色
  final Color labelColor; // 選択されたタブのラベルの色
  final Color unselectedLabelColor; // 選択されていないタブのラベルの色
  final bool isScrollable; // タブがスクロール可能かどうか
  final List<IconData>? icons; // タブのアイコンリスト

  CustomTabBar({
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
