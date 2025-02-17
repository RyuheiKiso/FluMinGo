import 'package:flutter/material.dart';

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
  final String title;
  final String content;
  final List<Widget> actions;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final Icon? leadingIcon;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Widget? customIcon;
  final bool dismissible; // 新しいプロパティ

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
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => dismissible, // dismissibleプロパティを使用
      child: AlertDialog(
        shape: shape,
        backgroundColor: backgroundColor,
        title: Row(
          children: [
            if (leadingIcon != null) leadingIcon!,
            if (customIcon != null) customIcon!,
            SizedBox(width: 8.0),
            Text(title, style: titleStyle),
          ],
        ),
        content: Text(content, style: contentStyle),
        actions: actions,
      ),
    );
  }
}
