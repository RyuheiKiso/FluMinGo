import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 概要: アプリバーコンポーネント
// 目的: タイトルを表示するカスタムアプリバーウィジェット
// 使用方法: AppBarComponent(title: 'タイトル', backgroundColor: Colors.blue, titleStyle: TextStyle(color: Colors.white), iconTheme: IconThemeData(color: Colors.white), actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})], leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}), elevation: 4.0, shadowColor: Colors.grey, shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.0))), bottom: PreferredSize(preferredSize: Size.fromHeight(50.0), child: Text('Bottom Widget')), flexibleSpace: FlexibleSpaceBar(title: Text('Flexible Space')), automaticallyImplyLeading: true, brightness: Brightness.dark);

/// アプリバーコンポーネント
///
/// [AppBarComponent]はタイトルを表示するカスタムアプリバーウィジェットです。
///
/// ```dart
/// AppBarComponent(
///   title: 'タイトル',
///   backgroundColor: Colors.blue,
///   titleStyle: TextStyle(color: Colors.white),
///   iconTheme: IconThemeData(color: Colors.white),
///   actions: [
///     IconButton(
///       icon: Icon(Icons.settings),
///       onPressed: () {},
///     ),
///   ],
///   leading: IconButton(
///     icon: Icon(Icons.menu),
///     onPressed: () {},
///   ),
///   elevation: 4.0,
///   shadowColor: Colors.grey,
///   shape: RoundedRectangleBorder(
///     borderRadius: BorderRadius.vertical(
///       bottom: Radius.circular(16.0),
///     ),
///   ),
///   bottom: PreferredSize(
///     preferredSize: Size.fromHeight(50.0),
///     child: Text('Bottom Widget'),
///   ),
///   flexibleSpace: FlexibleSpaceBar(
///     title: Text('Flexible Space'),
///   ),
///   automaticallyImplyLeading: true,
///   brightness: Brightness.dark,
/// )
/// ```
class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  // アプリバーのタイトル
  final String title;
  // アプリバーの背景色
  final Color backgroundColor;
  // タイトルのスタイル
  final TextStyle? titleStyle;
  // アイコンのテーマ
  final IconThemeData? iconTheme;
  // アプリバーのアクションボタン
  final List<Widget> actions;
  // タイトルを中央に配置するかどうか
  final bool centerTitle;
  // ステータスバーのスタイル
  final SystemUiOverlayStyle? systemOverlayStyle;
  // アプリバーの先頭に表示するウィジェット
  final Widget? leading;
  // アプリバーの影の高さ
  final double? elevation;
  // 影の色
  final Color? shadowColor;
  // アプリバーの形状
  final ShapeBorder? shape;
  // アプリバーの下部に表示するウィジェット
  final PreferredSizeWidget? bottom;
  // アプリバーの背景に表示するカスタムウィジェット
  final Widget? flexibleSpace;
  // leadingウィジェットが指定されていない場合に自動的に戻るボタンを表示するかどうか
  final bool automaticallyImplyLeading;
  // ステータスバーの明るさ
  final Brightness? brightness;
  // アイコンのサイズ
  final double? iconSize;
  // ラベルのフォントサイズ
  final double? labelFontSize;

  /// コンストラクタ
  ///
  /// [title] アプリバーのタイトル
  /// [backgroundColor] アプリバーの背景色
  /// [titleStyle] タイトルのスタイル
  /// [iconTheme] アイコンのテーマ
  /// [actions] アプリバーのアクションボタン
  /// [centerTitle] タイトルを中央に配置するかどうか
  /// [systemOverlayStyle] ステータスバーのスタイル
  /// [leading] アプリバーの先頭に表示するウィジェット
  /// [elevation] アプリバーの影の高さ
  /// [shadowColor] 影の色
  /// [shape] アプリバーの形状
  /// [bottom] アプリバーの下部に表示するウィジェット
  /// [flexibleSpace] アプリバーの背景に表示するカスタムウィジェット
  /// [automaticallyImplyLeading] leadingウィジェットが指定されていない場合に自動的に戻るボタンを表示するかどうか
  /// [brightness] ステータスバーの明るさ
  /// [iconSize] アイコンのサイズ
  /// [labelFontSize] ラベルのフォントサイズ
  const AppBarComponent({
    super.key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.titleStyle,
    this.iconTheme,
    this.actions = const [],
    this.centerTitle = false,
    this.systemOverlayStyle,
    this.leading,
    this.elevation,
    this.shadowColor,
    this.shape,
    this.bottom,
    this.flexibleSpace,
    this.automaticallyImplyLeading = true,
    this.brightness,
    this.iconSize,
    this.labelFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // タイトル
      title: Text(title, style: titleStyle?.copyWith(fontSize: labelFontSize)),
      // 背景色
      backgroundColor: backgroundColor,
      // アイコンのテーマ
      iconTheme: iconTheme?.copyWith(size: iconSize),
      // アクションボタン
      actions: actions,
      // タイトルを中央に配置するかどうか
      centerTitle: centerTitle,
      // 先頭に表示するウィジェット
      leading: leading,
      // 影の高さ
      elevation: elevation,
      // 影の色
      shadowColor: shadowColor,
      // 形状
      shape: shape,
      // 下部に表示するウィジェット
      bottom: bottom,
      // 背景に表示するカスタムウィジェット
      flexibleSpace: flexibleSpace,
      // leadingウィジェットが指定されていない場合に自動的に戻るボタンを表示するかどうか
      automaticallyImplyLeading: automaticallyImplyLeading,
      // ステータスバーのスタイル
      systemOverlayStyle:
          systemOverlayStyle ??
          (brightness == Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
