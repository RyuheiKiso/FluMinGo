import 'package:flutter/material.dart';

// プログレスインジケーターコンポーネント
class ProgressIndicatorComponent extends StatelessWidget {
  final double value;

  const ProgressIndicatorComponent({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: value,
    );
  }
}
