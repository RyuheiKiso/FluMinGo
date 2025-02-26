import 'package:flutter/material.dart';

// 概要: ベースページの抽象クラス
// 目的: 各ページの共通レイアウトを提供する
// 使用方法: class MyPage extends BasePage { ... }

// Updated BasePage to be more abstract
abstract class BasePage extends StatelessWidget {
  const BasePage({super.key});

  // Abstract getter for title
  String get title;

  // Abstract method to build the body of the screen
  Widget buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: buildBody(context),
    );
  }
}
