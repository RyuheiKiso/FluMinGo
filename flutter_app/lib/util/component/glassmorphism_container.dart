import 'dart:ui';
import 'package:flutter/material.dart';

// グラスモーフィズムコンテナコンポーネント
class GlassmorphismContainer extends StatelessWidget {
  final Widget child;

  const GlassmorphismContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0.05)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
