import 'package:shared_preferences/shared_preferences.dart';
import '../base_manager.dart';

class UserPreferencesManager extends BaseManager {
  // ユーザー設定の基本機能を実装
  Future<void> savePreference(String key, String value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
      log("Preference saved: $key = $value");
    } catch (e) {
      handleError(e as Exception);
    }
  }

  Future<String?> getPreference(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? value = prefs.getString(key);
      log("Preference retrieved: $key = $value");
      return value;
    } catch (e) {
      handleError(e as Exception);
      return null;
    }
  }

  Future<void> removePreference(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
      log("Preference removed: $key");
    } catch (e) {
      handleError(e as Exception);
    }
  }
}