import 'package:flutter/material.dart';

/// スライダーコンポーネント
/// 
/// [SliderComponent]は値と値変更時のコールバックを受け取るカスタムスライダーウィジェットです。
/// 
/// ```dart
/// SliderComponent(
///   value: 0.5,
///   onChanged: (value) {
///     print('Slider value: $value');
///   },
/// )
/// ```
class SliderComponent extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  /// コンストラクタ
  /// 
  /// [value] スライダーの値
  /// [onChanged] 値が変更されたときに呼び出されるコールバック
  const SliderComponent({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
    );
  }
}
