import 'package:flutter/material.dart';

// タイムラインコンポーネント
class TimelineComponent extends StatelessWidget {
  final List<Widget> items;

  const TimelineComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items,
    );
  }
}