import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

// エラーハンドラーヘルパー

// 使用方法:
// 1. アプリケーションの初期化時に ErrorHandler.initialize() を呼び出します。
//    await ErrorHandler.initialize();
// 2. エラーが発生した場合に ErrorHandler.showError('エラーメッセージ') を呼び出します。
//    ErrorHandler.showError('エラーメッセージ');
Map<String, dynamic> _convertYamlMapToMap(YamlMap yamlMap) {
  final map = <String, dynamic>{};
  yamlMap.forEach((key, value) {
    if (value is YamlMap) {
      map[key] = _convertYamlMapToMap(value);
    } else if (value is YamlList) {
      map[key] = value.map((e) => e is YamlMap ? _convertYamlMapToMap(e) : e).toList();
    } else {
      map[key] = value;
    }
  });
  return map;
}

class ErrorHandler {
  static late String logFilePath;

  // 初期化メソッド
  static Future<void> initialize() async {
    final config = await _loadConfig();
    logFilePath = config['log_file_path'] ?? 'test_log.txt';
  }

  // 設定ファイルを読み込むメソッド
  static Future<Map<String, dynamic>> _loadConfig() async {
    final file = File('config.yml'); // 相対パスに変更
    final content = await file.readAsString();
    final yamlMap = loadYaml(content) as YamlMap;
    return _convertYamlMapToMap(yamlMap);
  }

  // エラーメッセージを表示するメソッド
  static void showError(BuildContext context, String message) {
    // ここにエラーメッセージ表示処理を実装
    if (kDebugMode) {
      print(message);
    }
    _logErrorToFile(message);
    _showErrorDialog(context, message);
  }

  // エラーダイアログを表示するメソッド
  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('エラー'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // エラーログをファイルに保存するメソッド
  static void _logErrorToFile(String message) async {
    final file = File(logFilePath);
    final timestamp = DateTime.now().toIso8601String();
    await file.writeAsString('$timestamp: $message\n', mode: FileMode.append);
  }
}