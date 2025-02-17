import 'package:flutter/material.dart';

// カスタムスイッチコンポーネント
class CustomSwitch extends StatelessWidget {
  final bool value; // スイッチの状態
  final ValueChanged<bool> onChanged; // スイッチの状態が変更されたときのコールバック
  final String label; // スイッチのラベル
  final Color activeColor; // スイッチがオンのときの色
  final Color inactiveColor; // スイッチがオフのときの色

  CustomSwitch({required this.value, required this.onChanged, this.label = '', this.activeColor = Colors.blue, this.inactiveColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
