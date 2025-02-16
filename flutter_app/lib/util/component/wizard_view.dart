import 'package:flutter/material.dart';

// カスタムウィザードビューコンポーネント
class CustomWizardView extends StatefulWidget {
  final List<Widget> steps;

  const CustomWizardView({super.key, required this.steps});

  @override
  // ignore: library_private_types_in_public_api
  _CustomWizardViewState createState() => _CustomWizardViewState();
}

class _CustomWizardViewState extends State<CustomWizardView> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep < widget.steps.length - 1) {
          setState(() {
            _currentStep += 1;
          });
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep -= 1;
          });
        }
      },
      steps: widget.steps.map((step) => Step(title: Text('ステップ ${widget.steps.indexOf(step) + 1}'), content: step)).toList(),
    );
  }
}
