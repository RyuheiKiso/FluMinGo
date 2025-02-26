import 'package:flutter/material.dart';

/// チップコンポーネント
/// 概要: テキスト、背景色、およびテキストの色を受け取るカスタムチップウィジェット
/// 目的: ユーザーがタグやラベルを表示するためのUIを提供
/// 使用方法: CustomChip(label: 'Example', backgroundColor: Colors.blue, textColor: Colors.white);
///
/// [CustomChip]はテキスト、背景色、およびテキストの色を受け取るカスタムチップウィジェットです。
///
/// ```dart
/// CustomChip(
///   label: 'Example',
///   backgroundColor: Colors.blue,
///   textColor: Colors.white,
/// )
/// ```
class CustomChip extends StatelessWidget {
  // テキストラベル
  final String label;
  // 背景色
  final Color color;
  // テキストの色
  final Color textColor;
  // 削除アイコンが押されたときのコールバック
  final VoidCallback? onDeleted;
  // 枠線の色
  final Color? borderColor;
  // 枠線の幅
  final double? borderWidth;

  /// コンストラクタ
  ///
  /// [label] チップに表示するテキスト
  /// [color] チップの背景色
  /// [textColor] チップのテキストの色
  /// [onDeleted] チップの削除アイコンが押されたときに呼び出されるコールバック
  /// [borderColor] チップの枠線の色
  /// [borderWidth] チップの枠線の幅
  const CustomChip({
    super.key,
    required this.label,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.onDeleted,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      // テキストラベルを表示
      label: Text(label, style: TextStyle(color: textColor)),
      // 背景色を設定
      backgroundColor: color,
      // onDeletedがnullでない場合に削除アイコンを表示
      onDeleted: onDeleted,
      shape: StadiumBorder(
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0.0,
        ),
      ),
    );
  }
}
