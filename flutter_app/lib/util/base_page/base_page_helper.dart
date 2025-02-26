import 'package:flutter/material.dart';

// ベースページヘルパー
class BasePageHelper {
  // ページ遷移を行うメソッド
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
