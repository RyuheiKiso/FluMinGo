import 'package:flutter_app/util/base_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logging/logging.dart';
import 'package:mockito/mockito.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('BaseManager', () {
    late BaseManager baseManager;
    late MockLogger mockLogger;

    setUp(() {
      mockLogger = MockLogger();
      baseManager = BaseManager();
      baseManager.logger = mockLogger;
    });

    test('log should log message at info level', () {
      const message = 'Test message';
      baseManager.log(message);
      verify(mockLogger.info(message)).called(1);
    });

    test('handleError should log error at severe level', () {
      final exception = Exception('Test exception');
      baseManager.handleError(exception);
      verify(mockLogger.severe(exception.toString())).called(1);
    });

    test('performNetworkRequest should log success message', () async {
      const url = 'https://example.com';
      await baseManager.performNetworkRequest(url);
      verify(mockLogger.info('Request to $url successful')).called(1);
    });
  });
}
