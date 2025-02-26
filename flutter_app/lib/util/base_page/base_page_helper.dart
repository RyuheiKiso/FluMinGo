import 'package:flutter/material.dart';

// 概要: ページ遷移を支援するヘルパークラス
// 目的: ページ遷移の簡略化
// 使用方法: BasePageHelper.navigateTo(context, MyPage());

// ベースページヘルパー
class BasePageHelper {
  // ページ遷移を行うメソッド
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
