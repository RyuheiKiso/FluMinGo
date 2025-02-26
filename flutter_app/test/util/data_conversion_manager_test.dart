import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/util/data_conversion/data_conversion_manager.dart';

void main() {
  group('DataConversionManager Tests', () {
    test('jsonToMap converts JSON string to Map', () {
      final manager = DataConversionManager();
      final jsonString = '{"key": "value"}';
      final result = manager.jsonToMap(jsonString);
      expect(result, {'key': 'value'});
    });

    test('mapToJson converts Map to JSON string', () {
      final manager = DataConversionManager();
      final map = {'key': 'value'};
      final result = manager.mapToJson(map);
      expect(result, '{"key":"value"}');
    });

    test('stringToDate converts date string to DateTime', () {
      final manager = DataConversionManager();
      final dateString = '2023-10-10T10:00:00.000Z';
      final result = manager.stringToDate(dateString);
      expect(result, DateTime.parse(dateString));
    });

    test('dateToString converts DateTime to date string', () {
      final manager = DataConversionManager();
      final date = DateTime.parse('2023-10-10T10:00:00.000Z');
      final result = manager.dateToString(date);
      expect(result, '2023-10-10T10:00:00.000Z');
    });
  });
}
