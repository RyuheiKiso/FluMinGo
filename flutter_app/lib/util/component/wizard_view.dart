import 'package:flutter/material.dart';

// カスタムウィザードビューコンポーネント
class WizardView extends StatefulWidget {
  // ステップのリスト
  final List<WizardStep> steps;

  WizardView({required this.steps});

  @override
  _WizardViewState createState() => _WizardViewState();
}

class _WizardViewState extends State<WizardView> {
  // 現在のステップ
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // プログレスインジケーター
        LinearProgressIndicator(
          value: (_currentStep + 1) / widget.steps.length,
        ),
        // 現在のステップのコンテンツ
        Expanded(
          child: widget.steps[_currentStep].content,
        ),
        // ナビゲーションボタン
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

// ウィザードステップクラス
class WizardStep {
  // ステップのコンテンツ
  final Widget content;

  WizardStep({required this.content});
}
