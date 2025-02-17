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
  final String label;
  final Color? backgroundColor;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Widget? icon; // 新しいプロパティ

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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.red,
        borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon!,
            SizedBox(width: 4.0),
          ],
          Text(
            label,
            style: labelStyle ?? TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}