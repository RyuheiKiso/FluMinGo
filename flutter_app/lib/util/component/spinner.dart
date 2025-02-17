import 'package:flutter/material.dart';

// カスタムスピナーコンポーネント
class CustomSpinner extends StatelessWidget {
  // スピナーのサイズ
  final double size;
  // スピナーの色
  final Color color;
  // アニメーションの速度
  final Duration duration;

  CustomSpinner({this.size = 50.0, this.color = Colors.blue, this.duration = const Duration(seconds: 1)});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
          strokeWidth: 5.0,
        ),
      ),
    );
  }
}
