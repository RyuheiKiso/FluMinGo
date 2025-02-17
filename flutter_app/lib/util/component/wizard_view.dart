import 'package:flutter/material.dart';

// カスタムウィザードビューコンポーネント
class WizardView extends StatefulWidget {
  final List<WizardStep> steps;

  WizardView({required this.steps});

  @override
  _WizardViewState createState() => _WizardViewState();
}

class _WizardViewState extends State<WizardView> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: (_currentStep + 1) / widget.steps.length,
        ),
        Expanded(
          child: widget.steps[_currentStep].content,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentStep > 0)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentStep--;
                  });
                },
                child: Text('Back'),
              ),
            if (_currentStep < widget.steps.length - 1)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentStep++;
                  });
                },
                child: Text('Next'),
              ),
          ],
        ),
      ],
    );
  }
}

class WizardStep {
  final Widget content;

  WizardStep({required this.content});
}
