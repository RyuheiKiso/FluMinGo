import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/util/json/json_helper.dart';

void main() {
  group('JsonHelper Tests', () {
    test('encode should convert object to JSON string', () {
      final object = {'key': 'value'};
      final jsonString = JsonHelper.encode(object);
      expect(jsonString, '{"key":"value"}');
    });

    test('decode should convert JSON string to object', () {
      final jsonString = '{"key":"value"}';
      final object = JsonHelper.decode(jsonString);
      expect(object, {'key': 'value'});
    });
  });
}
