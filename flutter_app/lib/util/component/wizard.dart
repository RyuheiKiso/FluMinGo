import 'package:flutter/material.dart';

// 概要: ウィザードコンポーネント
// 目的: ステップごとに進行するウィザードを表示する
// 使用方法: Wizard(steps: [WizardStep(content: Text('ステップ1')), WizardStep(content: Text('ステップ2'))])

// ウィザードコンポーネント
class Wizard extends StatefulWidget {
  // ステップのリスト
  final List<WizardStep> steps;
  final VoidCallback? onFinished; // 新機能①
  final ValueChanged<int>? onStepJump; // 新機能②

  const Wizard({
    super.key,
    required this.steps,
    this.onFinished, // 新機能①
    this.onStepJump, // 新機能②
  });

  @override
  // ignore: library_private_types_in_public_api
  _WizardState createState() => _WizardState();
}

class _WizardState extends State<Wizard> {
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
        Expanded(child: widget.steps[_currentStep].content),
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
                  widget.onStepJump?.call(_currentStep); // 新機能②
                },
                child: Text('Next'),
              )
            else
              ElevatedButton(
                // 新機能①：最終ステップで完了ボタンを表示
                onPressed: () {
                  widget.onFinished?.call();
                },
                child: Text('Finish'),
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
