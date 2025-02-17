import 'package:flutter/material.dart';

/// アバターコンポーネント
/// 
/// [AvatarComponent]はユーザーのアバター画像を表示するカスタムウィジェットです。
/// 
/// ```dart
/// AvatarComponent(
///   imageUrl: 'https://example.com/avatar.png',
///   radius: 20.0,
///   borderColor: Colors.blue,
///   borderWidth: 2.0,
///   placeholder: AssetImage('assets/placeholder.png'),
///   errorImage: AssetImage('assets/error.png'),
///   onTap: () {
///     print('Avatar tapped!');
///   },
///   backgroundColor: Colors.white,
///   foregroundColor: Colors.black,
///   borderRadius: BorderRadius.circular(10.0),
///   boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4.0)],
/// )
/// ```
class AvatarComponent extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final Color borderColor;
  final double borderWidth;
  final ImageProvider placeholder;
  final ImageProvider errorImage;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;

  /// コンストラクタ
  /// 
  /// [imageUrl] アバター画像のURL
  /// [radius] アバターの半径
  /// [borderColor] アバターの枠線の色
  /// [borderWidth] アバターの枠線の幅
  /// [placeholder] プレースホルダー画像
  /// [errorImage] エラー時のデフォルト画像
  /// [onTap] アバターがタップされた時のコールバック
  /// [backgroundColor] アバターの背景色
  /// [foregroundColor] アバターの前景色
  /// [borderRadius] アバターの角の丸み
  /// [boxShadow] アバターに追加する影
  const AvatarComponent({
    super.key,
    required this.imageUrl,
    required this.radius,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.placeholder = const AssetImage('assets/placeholder.png'),
    this.errorImage = const AssetImage('assets/error.png'),
    this.onTap,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: radius,
          onBackgroundImageError: (_, __) => errorImage,
          child: Image(image: placeholder),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
      ),
    );
  }
}