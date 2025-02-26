import 'package:flutter/material.dart';

// 概要: カスタムスイッチコンポーネント
// 目的: カスタムスイッチを提供する
// 使用方法: CustomSwitch(value: true, onChanged: (val) => print(val))

// カスタムスイッチコンポーネント
class CustomSwitch extends StatelessWidget {
  // スイッチの状態
  final bool value;
  // スイッチの状態が変更されたときのコールバック
  final ValueChanged<bool> onChanged;
  // スイッチのラベル
  final String label;
  // スイッチがオンのときの色
  final Color activeColor;
  // スイッチがオフのときの色
  final Color inactiveColor;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label = '',
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ラベルが空でない場合に表示
        if (label.isNotEmpty) Text(label),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          inactiveThumbColor: inactiveColor,
        ),
      ],
    );
  }
}
