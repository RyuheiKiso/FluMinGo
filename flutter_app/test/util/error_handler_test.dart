import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/util/error_handling/error_handler.dart';
import 'error_handler_test.mocks.dart';

@GenerateMocks([BuildContext, File])
void main() {
  group('ErrorHandler Tests', () {
    setUp(() async {
      final mockFile = MockFile();
      when(mockFile.readAsString()).thenAnswer((_) async => 'log_file_path: test_log.txt');
      await ErrorHandler.initialize();
    });

    test('initialize sets logFilePath', () async {
      expect(ErrorHandler.logFilePath, 'test_log.txt');
    });

    test('showError logs error to file', () async {
      final mockFile = MockFile();
      when(mockFile.writeAsString(any, mode: anyNamed('mode'))).thenAnswer((_) async => File('test_log.txt'));
      ErrorHandler.showError(MockBuildContext(), 'Test Error');
      verify(mockFile.writeAsString(contains('Test Error') as String?, mode: FileMode.append)).called(1);
    });

    test('showError displays error dialog', () async {
      final mockContext = MockBuildContext();
      ErrorHandler.showError(mockContext, 'Test Error');
      verify(mockContext.showDialog(any)).called(1);
    });
  });
}
