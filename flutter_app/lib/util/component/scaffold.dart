import 'package:flutter/material.dart';

// スキャフォールドコンポーネント
class ScaffoldComponent extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? appBarLeading;
  final List<Widget>? appBarActions;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;

  // コンストラクタにコメントを追加
  const ScaffoldComponent({
    Key? key,
    required this.title,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.appBarLeading,
    this.appBarActions,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: appBarLeading,
        actions: appBarActions,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}