import 'package:flutter/material.dart';

/// カルーセルコンポーネント
/// 
/// [CarouselComponent]はウィジェットのリストを受け取るカルーセルウィジェットです。
/// 
/// ```dart
/// CarouselComponent(
///   items: [
///     Container(color: Colors.red),
///     Container(color: Colors.green),
///     Container(color: Colors.blue),
///   ],
/// )
/// ```
class CarouselComponent extends StatelessWidget {
  final List<Widget> items;

  /// コンストラクタ
  /// 
  /// [items] カルーセル内に表示するウィジェットのリスト
  const CarouselComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: items,
    );
  }
}