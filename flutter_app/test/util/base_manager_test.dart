import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/util/base_manager.dart';

void main() {
  group('BaseManager Tests', () {
    late BaseManager baseManager;

    setUp(() {
      baseManager = BaseManager();
    });

    test('log method', () {
      expect(() => baseManager.log('Test log message'), returnsNormally);
    });

    test('handleError method', () {
      expect(() => baseManager.handleError(Exception('Test error')), returnsNormally);
    });

    test('performNetworkRequest method - success', () async {
      await baseManager.performNetworkRequest('https://example.com');
      // Check logs or other side effects if needed
    });

    test('performNetworkRequest method - failure', () async {
      await baseManager.performNetworkRequest('invalid_url');
      // Check logs or other side effects if needed
    });
  });
}
