import 'package:flutter/material.dart';

// ステッパーコンポーネント
class StepperComponent extends StatelessWidget {
  final List<Step> steps;
  final int currentStep;
  final ValueChanged<int> onStepTapped;
  final VoidCallback onStepContinue;
  final VoidCallback onStepCancel;

  const StepperComponent({super.key, required this.steps, required this.currentStep, required this.onStepTapped, required this.onStepContinue, required this.onStepCancel});

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: steps,
      currentStep: currentStep,
      onStepTapped: onStepTapped,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
    );
  }
}