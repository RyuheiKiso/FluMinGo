import 'package:flutter/material.dart';

// カスタムスピナーコンポーネント
class CustomSpinner extends StatelessWidget {
  final double size; // スピナーのサイズ
  final Color color; // スピナーの色
  final Duration duration; // アニメーションの速度

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
