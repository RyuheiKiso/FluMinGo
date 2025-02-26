// 概要: ロギングヘルパークラス
// 目的: ログの出力を管理する
// 使用方法: LoggingHelper.logInfo('情報メッセージ')

import 'package:logger/logger.dart';

class LoggingHelper {
  static final Logger _logger = Logger();

  static void logInfo(String message) {
    _logger.i(message);
  }

  static void logError(String message) {
    _logger.e(message);
  }
}
