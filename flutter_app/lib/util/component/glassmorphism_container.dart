import 'dart:ui';
import 'package:flutter/material.dart';

// 概要: グラスモーフィズムコンテナコンポーネント
// 目的: グラスモーフィズム効果を持つコンテナを簡単に作成するためのコンポーネント
// 使用方法: GlassmorphismContainer(child: Widget)

// グラスモーフィズムコンテナコンポーネント
class GlassmorphismContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blurSigma;
  final List<Color> gradientColors;

  // コンストラクタ
  GlassmorphismContainer({
    super.key,
    required this.child,
    this.borderRadius = 15.0,
    this.blurSigma = 10.0,
    List<Color>? gradientColors,
  }) : gradientColors =
           gradientColors ??
           [Colors.white.withAlpha(51), Colors.white.withAlpha(13)];

  @override
  Widget build(BuildContext context) {
    return Container(
      // ボックスデコレーションの設定
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withAlpha(26)),
      ),
      child: ClipRRect(
        // 角を丸める
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          // 背景をぼかす
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(alignment: Alignment.center, child: child),
        ),
      ),
    );
  }
}
