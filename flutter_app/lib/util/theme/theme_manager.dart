import 'package:flutter/material.dart';
import '../base_manager.dart';

class ThemeManager extends BaseManager {
  // テーマ管理の基本機能を実装
  void applyTheme(String theme) {
    // テーマ適用処理
    log("Applying theme: $theme");
    // ...テーマ適用の具体的な処理...
  }

  ThemeData getThemeData(String theme) {
    // テーマデータを取得する処理
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