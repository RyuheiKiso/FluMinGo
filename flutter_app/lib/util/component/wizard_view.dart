import 'package:flutter/material.dart';

// 概要: カスタムウィザードビューコンポーネント
// 目的: カスタムステップインジケーターを持つウィザードを表示する
// 使用方法: WizardView(steps: [WizardStep(content: Text('ステップ1')), WizardStep(content: Text('ステップ2'))])

// カスタムウィザードビューコンポーネント
class WizardView extends StatefulWidget {
  // ステップのリスト
  final List<WizardStep> steps;
  final VoidCallback? onCompleted; // 新機能①
  final Widget? customStepIndicator; // 新機能②

  const WizardView({
    super.key,
    required this.steps,
    this.onCompleted, // 新機能①
    this.customStepIndicator, // 新機能②
  });

  @override
  // ignore: library_private_types_in_public_api
  _WizardViewState createState() => _WizardViewState();
}

class _WizardViewState extends State<WizardView> {
  // 現在のステップ
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.customStepIndicator != null)
          widget.customStepIndicator!, // 新機能②
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
                },
                child: Text('Next'),
              )
            else
              ElevatedButton(
                // 新機能①：完了ボタン
                onPressed: () {
                  widget.onCompleted?.call();
                },
                child: Text('Complete'),
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
