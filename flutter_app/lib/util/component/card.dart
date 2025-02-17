import 'package:flutter/material.dart';

/// カードコンポーネント
/// 
/// [CardComponent]は子ウィジェットを受け取るカスタムカードウィジェットです。
/// 
/// ```dart
/// CardComponent(
///   child: Text('This is a card'),
///   color: Colors.blue,
///   elevation: 4.0,
///   borderRadius: BorderRadius.circular(8.0),
///   padding: EdgeInsets.all(16.0),
///   margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
///   shadowColor: Colors.black,
/// )
/// ```
class CardComponent extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? elevation;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? shadowColor;

  /// コンストラクタ
  /// 
  /// [child] カード内に表示するウィジェット
  /// [color] カードの背景色
  /// [elevation] カードの影の高さ
  /// [borderRadius] カードの角丸
  /// [padding] カードの内側余白
  /// [margin] カードの外側余白
  /// [shadowColor] カードの影の色
  const CardComponent({super.key, 
    required this.child, 
    this.color, 
    this.elevation,
    this.borderRadius,
    this.padding,
    this.margin,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Card(
        color: color,
        elevation: elevation,
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}