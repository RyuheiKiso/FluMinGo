import 'package:flutter/material.dart';

// スライダーコンポーネント
class SliderComponent extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const SliderComponent({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
    );
  }
}
