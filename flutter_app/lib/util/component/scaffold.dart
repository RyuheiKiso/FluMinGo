import 'package:flutter/material.dart';

// スキャフォールドコンポーネント
class ScaffoldComponent extends StatelessWidget {
  // タイトル
  final String title;
  // ボディ
  final Widget body;
  // フローティングアクションボタン
  final Widget? floatingActionButton;
  // ボトムナビゲーションバー
  final Widget? bottomNavigationBar;
  // ドロワー
  final Widget? drawer;
  // アプリバーのリーディングウィジェット
  final Widget? appBarLeading;
  // アプリバーのアクションウィジェットのリスト
  final List<Widget>? appBarActions;
  // バックグラウンドカラー
  final Color? backgroundColor;
  // ボトムインセットを避けるかどうか
  final bool resizeToAvoidBottomInset;

  // コンストラクタにコメントを追加
  const ScaffoldComponent({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.appBarLeading,
    this.appBarActions,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
  });

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
