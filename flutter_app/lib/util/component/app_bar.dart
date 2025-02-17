import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final String title;
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final IconThemeData? iconTheme;
  final List<Widget> actions;
  final bool centerTitle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Widget? leading;
  final double? elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final PreferredSizeWidget? bottom;
  final Widget? flexibleSpace;
  final bool automaticallyImplyLeading;
  final Brightness? brightness;

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
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleStyle,
      ),
      backgroundColor: backgroundColor,
      iconTheme: iconTheme,
      actions: actions,
      centerTitle: centerTitle,
      leading: leading,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      bottom: bottom,
      flexibleSpace: flexibleSpace,
      automaticallyImplyLeading: automaticallyImplyLeading,
      systemOverlayStyle: systemOverlayStyle ?? (brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}