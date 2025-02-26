import 'package:logging/logging.dart';

/// BaseManager class provides basic logging and error handling functionalities.
class BaseManager {
  // Logger instance for logging messages
  Logger _logger = Logger('BaseManager');

  /// Logs a message at the info level.
  ///
  /// [message] The message to log.
  void log(String message) {
    _logger.info(message);
  }

  /// Handles errors by logging them at the severe level.
  ///
  /// [e] The exception to handle.
  void handleError(Exception e) {
    _logger.severe(e.toString());
  }

  /// Performs a network request to the given URL.
  ///
  /// [url] The URL to request.
  Future<void> performNetworkRequest(String url) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      _logger.info("Request to $url successful");
    } on Exception catch (e) {
      handleError(e);
    }
  }

  set logger(Logger logger) => _logger = logger;
}
