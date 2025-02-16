import 'package:flutter/material.dart';

// カルーセルコンポーネント
class CarouselComponent extends StatelessWidget {
  final List<Widget> items;

  const CarouselComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: items,
    );
  }
}