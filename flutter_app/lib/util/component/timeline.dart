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
  // イベント間のスペーシング
  final double spacing; // 新機能②
  // イベントタップ時のコールバック
  final ValueChanged<int>? onEventTap; // 新機能①（index渡し）

  const TimelineComponent({
    super.key,
    required this.events,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.spacing = 8.0, // 新機能②
    this.onEventTap, // 新機能①
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      itemCount: events.length,
      itemBuilder:
          (context, index) => GestureDetector(
            onTap: () => onEventTap?.call(index), // 新機能①
            child: events[index],
          ),
      separatorBuilder: (context, index) => SizedBox(height: spacing), // 新機能②
    );
  }
}
