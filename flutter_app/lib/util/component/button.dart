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
  // ボタンに表示するテキスト
  final String label;
  // ボタンが押されたときに呼び出されるコールバック
  final VoidCallback onPressed;
  // ボタンの背景色
  final Color? backgroundColor;
  // ボタンのテキスト色
  final Color? textColor;
  // ボタンに表示するアイコン
  final IconData? icon;
  // ボタンの幅
  final double? width;
  // ボタンの高さ
  final double? height;
  // ボタンの角丸
  final BorderRadius? borderRadius;
  // ボタンの内側余白
  final EdgeInsetsGeometry? padding;
  // ボタンが押されたときにローディングインジケータを表示するかどうか
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
      // ボタンの幅を設定
      width: width,
      // ボタンの高さを設定
      height: height,
      child: ElevatedButton.icon(
        // ローディング中はボタンを無効化
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          // 背景色を設定
          backgroundColor: backgroundColor,
          // テキスト色を設定
          foregroundColor: textColor,
          // 角丸を設定
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.zero,
          ),
          // 内側余白を設定
          padding: padding,
        ),
        // ローディング中はインジケータを表示
        icon: isLoading ? CircularProgressIndicator(color: textColor) : (icon != null ? Icon(icon) : Container()),
        // ローディング中はテキストを変更
        label: isLoading ? Text('Loading...') : Text(label),
      ),
    );
  }
}
