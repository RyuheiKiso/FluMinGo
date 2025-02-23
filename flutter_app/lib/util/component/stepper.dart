import 'package:flutter/material.dart';

// カスタムステッパーコンポーネント
class CustomStepper extends StatelessWidget {
  // ステップのリスト
  final List<Step> steps;
  // 現在のステップ
  final int currentStep;
  // ステップがタップされたときのコールバック
  final Function(int) onStepTapped;
  // 続行ボタンが押されたときのコールバック
  final VoidCallback? onStepContinue;
  // キャンセルボタンが押されたときのコールバック
  final VoidCallback? onStepCancel;
  // カスタムの「続行」ボタン
  final Widget? customContinueButton;
  // カスタムの「キャンセル」ボタン
  final Widget? customCancelButton;

  const CustomStepper({super.key, 
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
            // カスタムの「続行」ボタンが設定されていない場合、デフォルトのボタンを表示
            customContinueButton ?? TextButton(
              onPressed: details.onStepContinue,
              child: const Text('CONTINUE'),
            ),
            // カスタムの「キャンセル」ボタンが設定されていない場合、デフォルトのボタンを表示
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