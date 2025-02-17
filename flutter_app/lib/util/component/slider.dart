import 'package:flutter/material.dart';

/// スライダーコンポーネント
/// 
/// [CustomSlider]は値と値変更時のコールバックを受け取るカスタムスライダーウィジェットです。
/// 
/// ```dart
/// CustomSlider(
///   value: 0.5,
///   onChanged: (value) {
///     print('Slider value: $value');
///   },
///   min: 0.0,
///   max: 1.0,
///   divisions: 10,
///   label: '0.5',
///   activeColor: Colors.blue,
///   inactiveColor: Colors.grey,
///   thumbColor: Colors.red,
/// )
/// ```
class CustomSlider extends StatelessWidget {
  final double value;
  final void Function(double) onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;

  /// コンストラクタ
  /// 
  /// [value] スライダーの値
  /// [onChanged] 値が変更されたときに呼び出されるコールバック
  /// [min] スライダーの最小値
  /// [max] スライダーの最大値
  /// [divisions] スライダーの分割数
  /// [label] スライダーのラベル
  /// [activeColor] スライダーのアクティブカラー
  /// [inactiveColor] スライダーのインアクティブカラー
  /// [thumbColor] スライダーのサムカラー
  const CustomSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
      min: min,
      max: max,
      divisions: divisions,
      label: label,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      thumbColor: thumbColor,
    );
  }
}
