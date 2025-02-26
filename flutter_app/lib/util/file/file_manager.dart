import 'dart:io';
import 'package:logging/logging.dart';

class FileManager {
  // ファイル操作の基本機能を実装

  final Logger _logger = Logger('FileManager');

  Future<String> readFile(String path) async {
    // ファイルを読み込む処理
    try {
      final file = File(path);
      return await file.readAsString();
    } catch (e) {
      _logger.severe('Error reading file: $e');
      return '';
    }
  }

  Future<void> writeFile(String path, String content) async {
    // ファイルに書き込む処理
    try {
      final file = File(path);
      await file.writeAsString(content);
    } catch (e) {
      _logger.severe('Error writing to file: $e');
    }
  }
}
