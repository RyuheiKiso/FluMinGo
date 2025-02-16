import 'package:flutter/material.dart';

// スピナーコンポーネント
class Spinner extends StatelessWidget {
  final double size;
  final Color color;

  const Spinner({super.key, this.size = 50.0, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ),
    );
  }
}
