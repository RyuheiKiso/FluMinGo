import 'package:flutter/material.dart';

/// ボタンコンポーネント
/// 
/// [Button]は、ラベルと押下時のコールバックを受け取るシンプルなボタンウィジェットです。
/// 
/// ```dart
/// Button(
///   label: 'Click me',
///   onPressed: () {
///     print('Button pressed');
///   },
///   backgroundColor: Colors.blue,
///   textColor: Colors.white,
///   icon: Icons.add,
///   width: 200,
///   height: 50,
///   borderRadius: BorderRadius.circular(8.0),
///   padding: EdgeInsets.all(16.0),
///   isLoading: true,
/// );
/// ```
class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;

  /// コンストラクタ
  /// 
  /// [label] ボタンに表示するテキスト
  /// [onPressed] ボタンが押されたときに呼び出されるコールバック
  /// [backgroundColor] ボタンの背景色
  /// [textColor] ボタンのテキスト色
  /// [icon] ボタンに表示するアイコン
  /// [width] ボタンの幅
  /// [height] ボタンの高さ
  /// [borderRadius] ボタンの角丸
  /// [padding] ボタンの内側余白
  /// [isLoading] ボタンが押されたときにローディングインジケータを表示するかどうか
  const Button({super.key, 
    required this.label, 
    required this.onPressed, 
    this.backgroundColor, 
    this.textColor,
    this.icon,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
          padding: padding,
        ),
        icon: isLoading ? CircularProgressIndicator(color: textColor) : (icon != null ? Icon(icon) : Container()),
        label: isLoading ? Text('Loading...') : Text(label),
      ),
    );
  }
}
