import 'package:flutter/material.dart';

// スイッチコンポーネント
class SwitchComponent extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchComponent({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
    );
  }
}
