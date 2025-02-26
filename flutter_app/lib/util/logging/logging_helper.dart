import 'package:logger/logger.dart';

// ロギングヘルパー
class LoggingHelper {
  static final Logger _logger = Logger();

  // 情報ログを出力するメソッド
  static void logInfo(String message) {
    _logger.i(message);
  }

  // エラーログを出力するメソッド
  static void logError(String message) {
    _logger.e(message);
  }
}
