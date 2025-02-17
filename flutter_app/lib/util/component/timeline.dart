import 'package:flutter/material.dart';

// タイムラインコンポーネント
class TimelineComponent extends StatelessWidget {
  final List<Widget> events;
  final Axis scrollDirection; // 新しいプロパティ
  final bool reverse; // 新しいプロパティ
  final ScrollController? controller; // 新しいプロパティ

  const TimelineComponent({
    super.key,
    required this.events,
    this.scrollDirection = Axis.vertical, // デフォルト値を設定
    this.reverse = false, // デフォルト値を設定
    this.controller, // 新しいプロパティ
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: events,
      scrollDirection: scrollDirection,
      reverse: reverse, // 新しいプロパティ
      controller: controller, // 新しいプロパティ
    );
  }
}