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
///   borderColor: Colors.red,
///   borderWidth: 2.0,
/// )
/// ```
class CardComponent extends StatelessWidget {
  // カード内に表示するウィジェット
  final Widget child;
  // カードの背景色
  final Color? color;
  // カードの影の高さ
  final double? elevation;
  // カードの角丸
  final BorderRadius? borderRadius;
  // カードの内側余白
  final EdgeInsetsGeometry? padding;
  // カードの外側余白
  final EdgeInsetsGeometry? margin;
  // カードの影の色
  final Color? shadowColor;
  // カードの枠線の色
  final Color? borderColor;
  // カードの枠線の幅
  final double? borderWidth;

  /// コンストラクタ
  ///
  /// [child] カード内に表示するウィジェット
  /// [color] カードの背景色
  /// [elevation] カードの影の高さ
  /// [borderRadius] カードの角丸
  /// [padding] カードの内側余白
  /// [margin] カードの外側余白
  /// [shadowColor] カードの影の色
  /// [borderColor] カードの枠線の色
  /// [borderWidth] カードの枠線の幅
  const CardComponent({
    super.key,
    required this.child,
    this.color,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.margin,
    this.shadowColor,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // 外側余白を設定
      margin: margin,
      child: Card(
        // 背景色を設定
        color: color,
        // 影の高さを設定
        elevation: elevation,
        // 影の色を設定
        shadowColor: shadowColor,
        // 角丸を設定
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 0.0,
          ),
        ),
        child: Padding(
          // 内側余白を設定
          padding: padding ?? const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
