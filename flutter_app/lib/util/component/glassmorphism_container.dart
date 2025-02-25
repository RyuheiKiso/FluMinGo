import 'dart:ui';
import 'package:flutter/material.dart';

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
  }) : gradientColors = gradientColors ?? [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.05)];

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
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: ClipRRect(
        // 角を丸める
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          // 背景をぼかす
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
