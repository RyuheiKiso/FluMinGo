import 'package:flutter/material.dart';

// 概要: カスタムスピナーコンポーネント
// 目的: ローディングインジケーターを表示する
// 使用方法: CustomSpinner(size: 50.0, color: Colors.blue, duration: Duration(seconds: 1))

class CustomSpinner extends StatelessWidget {
  // スピナーのサイズ
  final double size;
  // スピナーの色
  final Color color;
  // アニメーションの速度
  final Duration duration;

  const CustomSpinner({
    super.key,
    this.size = 50.0,
    this.color = Colors.blue,
    this.duration = const Duration(seconds: 1),
  });

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
