import 'package:flutter/material.dart';

/// バッジコンポーネント
///
/// [BadgeComponent]はラベルを表示するカスタムバッジウィジェットです。
///
/// ```dart
/// BadgeComponent(
///   label: 'New',
///   backgroundColor: Colors.red,
///   icon: Icon(Icons.star), // アイコンを追加
/// )
/// ```
class BadgeComponent extends StatelessWidget {
  // バッジに表示するラベル
  final String label;
  // バッジの背景色
  final Color? backgroundColor;
  // ラベルのスタイル
  final TextStyle? labelStyle;
  // バッジの内側の余白
  final EdgeInsetsGeometry? padding;
  // バッジの角の丸み
  final double? borderRadius;
  // バッジに表示するアイコン
  final Widget? icon; // 新しいプロパティ
  // 新しいプロパティ
  final double? iconSize;
  final double? labelFontSize;

  /// コンストラクタ
  ///
  /// [label] バッジに表示するラベル
  /// [backgroundColor] バッジの背景色
  /// [labelStyle] ラベルのスタイル
  /// [padding] バッジの内側の余白
  /// [borderRadius] バッジの角の丸み
  /// [icon] バッジに表示するアイコン
  const BadgeComponent({
    super.key,
    required this.label,
    this.backgroundColor,
    this.labelStyle,
    this.padding,
    this.borderRadius,
    this.icon,
    this.iconSize,
    this.labelFontSize,
  });

  @override
  Widget build(BuildContext context) {
    // バッジのコンテナを返す
    return Container(
      // バッジの内側の余白
      padding: padding ?? EdgeInsets.all(8.0),
      // バッジの装飾
      decoration: BoxDecoration(
        // バッジの背景色
        color: backgroundColor ?? Colors.red,
        // バッジの角の丸み
        borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // アイコンが存在する場合
          if (icon != null) ...[icon!, SizedBox(width: 4.0)],
          // ラベルのテキスト
          Text(
            label,
            style:
                labelStyle ??
                TextStyle(color: Colors.white, fontSize: labelFontSize),
          ),
        ],
      ),
    );
  }
}
