import 'package:flutter/material.dart';

// 概要: アラートダイアログコンポーネント
// 目的: タイトル、コンテンツ、およびアクションを受け取るカスタムアラートダイアログウィジェット
// 使用方法: CustomAlert(title: 'Alert', content: 'This is an alert message.', actions: [TextButton(onPressed: () { Navigator.of(context).pop(); }, child: Text('OK'))]);

/// アラートダイアログコンポーネント
///
/// [CustomAlert]は、タイトル、コンテンツ、およびアクションを受け取るカスタムアラートダイアログウィジェットです。
///
/// ```dart
/// CustomAlert(
///   title: 'Alert',
///   content: 'This is an alert message.',
///   actions: [
///     TextButton(
///       onPressed: () {
///         Navigator.of(context).pop();
///       },
///       child: Text('OK'),
///     ),
///   ],
/// );
/// ```
class CustomAlert extends StatelessWidget {
  // タイトル
  final String title;
  // コンテンツ
  final String content;
  // アクションボタン
  final List<Widget> actions;
  // タイトルのカスタムスタイル
  final TextStyle? titleStyle;
  // コンテンツのカスタムスタイル
  final TextStyle? contentStyle;
  // タイトルの前に表示するアイコン
  final Icon? leadingIcon;
  // アラートダイアログの形状
  final ShapeBorder? shape;
  // アラートダイアログの背景色
  final Color? backgroundColor;
  // カスタムアイコン
  final Widget? customIcon;
  // ダイアログがタップで閉じるかどうか
  final bool dismissible; // 新しいプロパティ
  // 新しいプロパティ
  final double? iconSize;
  final double? labelFontSize;

  /// コンストラクタ
  ///
  /// [title] アラートダイアログのタイトル
  /// [content] アラートダイアログのコンテンツ
  /// [actions] アラートダイアログのアクションボタン
  /// [titleStyle] タイトルのカスタムスタイル
  /// [contentStyle] コンテンツのカスタムスタイル
  /// [leadingIcon] タイトルの前に表示するアイコン
  /// [shape] アラートダイアログの形状
  /// [backgroundColor] アラートダイアログの背景色
  /// [customIcon]はカスタムアイコンを指定します。
  /// [dismissible]はダイアログがタップで閉じるかどうかを指定します。
  /// [iconSize]はアイコンのサイズを指定します。
  /// [labelFontSize]はラベルのフォントサイズを指定します。
  const CustomAlert({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.titleStyle,
    this.contentStyle,
    this.leadingIcon,
    this.shape,
    this.backgroundColor,
    this.customIcon,
    this.dismissible = true, // 新しいプロパティ
    this.iconSize,
    this.labelFontSize,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      // dismissibleプロパティを使用
      onWillPop: () async => dismissible,
      child: AlertDialog(
        shape: shape,
        backgroundColor: backgroundColor,
        title: Row(
          children: [
            // leadingIconが存在する場合に表示
            if (leadingIcon != null) leadingIcon!,
            // customIconが存在する場合に表示
            if (customIcon != null) customIcon!,
            SizedBox(width: 8.0),
            // タイトルの表示
            Text(title, style: titleStyle?.copyWith(fontSize: labelFontSize)),
          ],
        ),
        // コンテンツの表示
        content: Text(
          content,
          style: contentStyle?.copyWith(fontSize: labelFontSize),
        ),
        // アクションボタンの表示
        actions: actions,
      ),
    );
  }
}
