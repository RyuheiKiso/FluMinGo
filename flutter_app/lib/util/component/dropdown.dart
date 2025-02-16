import 'package:flutter/material.dart';

// ドロップダウンコンポーネント
class DropdownComponent<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;

  const DropdownComponent({super.key, required this.items, this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
