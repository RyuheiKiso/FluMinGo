import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/util/animation/animation_manager.dart';

void main() {
  group('AnimationManager Tests', () {
    late AnimationManager animationManager;

    setUp(() {
      animationManager = AnimationManager();
    });

    test('startAnimation starts the timer', () {
      animationManager.startAnimation();
      expect(animationManager.timer, isNotNull);
    });

    test('stopAnimation stops the timer', () {
      animationManager.startAnimation();
      animationManager.stopAnimation();
      expect(animationManager.timer, isNull);
    });

    test('resetAnimation resets the timer', () {
      animationManager.startAnimation();
      Timer? oldTimer = animationManager.timer;
      animationManager.resetAnimation();
      expect(animationManager.timer, isNot(equals(oldTimer)));
    });
  });
}
