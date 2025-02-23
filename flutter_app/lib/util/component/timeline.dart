import 'package:flutter/material.dart';

// タイムラインコンポーネント
class TimelineComponent extends StatelessWidget {
  // イベントのリスト
  final List<Widget> events;
  // スクロール方向
  final Axis scrollDirection;
  // 逆方向にスクロールするかどうか
  final bool reverse;
  // スクロールコントローラー
  final ScrollController? controller;

  const TimelineComponent({
    super.key,
    required this.events,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      children: events,
    );
  }
}