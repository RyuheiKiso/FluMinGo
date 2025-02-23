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
  // アバター画像のURL
  final String imageUrl;
  // アバターの半径
  final double radius;
  // アバターの枠線の色
  final Color borderColor;
  // アバターの枠線の幅
  final double borderWidth;
  // プレースホルダー画像
  final ImageProvider placeholder;
  // エラー時のデフォルト画像
  final ImageProvider errorImage;
  // アバターがタップされた時のコールバック
  final VoidCallback? onTap;
  // アバターの背景色
  final Color? backgroundColor;
  // アバターの前景色
  final Color? foregroundColor;
  // アバターの角の丸み
  final BorderRadius? borderRadius;
  // アバターに追加する影
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
    // ジェスチャーデテクターを返す
    return GestureDetector(
      // タップ時のコールバック
      onTap: onTap,
      child: Container(
        // 枠線の幅に応じた内側の余白
        padding: EdgeInsets.all(borderWidth),
        // コンテナの装飾
        decoration: BoxDecoration(
          // 形状を円形に設定
          shape: BoxShape.circle,
          // 枠線の設定
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          // 角の丸み
          borderRadius: borderRadius,
          // 影の設定
          boxShadow: boxShadow,
        ),
        child: CircleAvatar(
          // 背景画像
          backgroundImage: NetworkImage(imageUrl),
          // 半径
          radius: radius,
          // 背景画像のエラー時の処理
          onBackgroundImageError: (_, __) => errorImage,
          // 背景色
          backgroundColor: backgroundColor,
          // 前景色
          foregroundColor: foregroundColor,
          // プレースホルダー画像
          child: Image(image: placeholder),
        ),
      ),
    );
  }
}