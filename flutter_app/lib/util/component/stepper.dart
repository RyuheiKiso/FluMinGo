import 'package:flutter/material.dart';

// カスタムステッパーコンポーネント
class CustomStepper extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  final Function(int) onStepTapped;
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepCancel;
  final Widget? customContinueButton; // カスタムの「続行」ボタン
  final Widget? customCancelButton; // カスタムの「キャンセル」ボタン

  CustomStepper({
    required this.steps,
    required this.currentStep,
    required this.onStepTapped,
    required this.onStepContinue,
    required this.onStepCancel,
    this.customContinueButton,
    this.customCancelButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: currentStep,
      onStepTapped: onStepTapped,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return Row(
          children: <Widget>[
            customContinueButton ?? TextButton(
              onPressed: details.onStepContinue,
              child: const Text('CONTINUE'),
            ),
            customCancelButton ?? TextButton(
              onPressed: details.onStepCancel,
              child: const Text('CANCEL'),
            ),
          ],
        );
      },
    );
  }
}