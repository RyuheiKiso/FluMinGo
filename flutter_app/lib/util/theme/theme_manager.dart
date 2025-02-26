// 概要: テーマの管理
// 目的: アプリケーションのテーマを適用、取得する
// 使用方法: ThemeManager().applyTheme('light')

import 'package:flutter/material.dart';
import '../base_manager.dart';

class ThemeManager extends BaseManager {
  void applyTheme(String theme) {
    log("Applying theme: $theme");
    // ...テーマ適用の具体的な処理...
  }

  ThemeData getThemeData(String theme) {
    switch (theme) {
      case 'dark':
        return ThemeData.dark();
      case 'light':
        return ThemeData.light();
      default:
        return ThemeData.light();
    }
  }
}
