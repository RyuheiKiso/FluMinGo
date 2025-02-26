// 概要: キャッシュ管理を行うクラス
// 目的: キャッシュの保存、取得、削除、クリアを行う
// 使用方法: CacheManager().saveCache('key', 'value');

import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  // キャッシュ管理の基本機能を実装

  // キャッシュを保存する
  Future<void> saveCache(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception('Invalid value type');
    }
  }

  // キャッシュを取得する
  Future<dynamic> getCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  // キャッシュを削除する
  Future<void> deleteCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // 全てのキャッシュをクリアする
  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
