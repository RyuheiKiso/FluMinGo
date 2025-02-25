import 'package:logging/logging.dart';

class BaseManager {
  final Logger _logger = Logger('BaseManager');

  // 共通機能を実装
  void log(String message) {
    // ログ出力処理
    _logger.info(message);
  }

  void handleError(Exception e) {
    // エラーハンドリング処理
    _logger.severe(e.toString());
  }

  Future<void> performNetworkRequest(String url) async {
    // ネットワークリクエスト処理
    try {
      // ダミーのネットワークリクエスト
      await Future.delayed(Duration(seconds: 2));
      _logger.info("Request to $url successful");
    } catch (e) {
      handleError(e as Exception);
    }
  }
}
