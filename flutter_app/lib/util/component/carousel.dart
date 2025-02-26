import 'dart:async';
import 'package:flutter/material.dart';

/// カルーセルコンポーネント
/// 概要: ウィジェットのリストを受け取るカルーセルウィジェット
/// 目的: ユーザーが複数のコンテンツをスライド形式で表示するためのUIを提供
/// 使用方法: CarouselComponent(items: [Container(color: Colors.red), Container(color: Colors.green), Container(color: Colors.blue)]);
class CarouselComponent extends StatelessWidget {
  // カルーセル内に表示するウィジェットのリスト
  final List<Widget> items;

  /// コンストラクタ
  ///
  /// [items] カルーセル内に表示するウィジェットのリスト
  const CarouselComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return PageView(
      // ウィジェットのリストを表示
      children: items,
    );
  }
}

/// カルーセル
/// 概要: 自動再生機能を持つカルーセルウィジェット
/// 目的: ユーザーが複数のコンテンツをスライド形式で表示するためのUIを提供
/// 使用方法: Carousel(items: [Container(color: Colors.red), Container(color: Colors.green), Container(color: Colors.blue)], autoPlay: true, autoPlayInterval: Duration(seconds: 3));
class Carousel extends StatefulWidget {
  // カルーセル内に表示するウィジェットのリスト
  final List<Widget> items;
  // ページが自動的に切り替わる間隔
  final Duration interval;
  final bool autoPlay;
  final Duration autoPlayInterval;

  /// コンストラクタ
  ///
  /// [items] カルーセル内に表示するウィジェットのリスト
  /// [interval] ページが自動的に切り替わる間隔
  const Carousel({
    super.key,
    required this.items,
    this.interval = const Duration(seconds: 3),
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
  });

  @override
  // ignore: library_private_types_in_public_api
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  // 現在のページインデックス
  int _currentIndex = 0;
  // ページコントローラ
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // 初期ページを設定
    _pageController = PageController(initialPage: _currentIndex);
    // タイマーを使って自動的にページを切り替える
    if (widget.autoPlay) {
      Timer.periodic(widget.autoPlayInterval, (Timer timer) {
        if (_currentIndex < widget.items.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }
        // ページをアニメーションで切り替える
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    }
  }

  @override
  void dispose() {
    // ページコントローラを破棄
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // ページコントローラを設定
      controller: _pageController,
      // アイテムの数を設定
      itemCount: widget.items.length,
      // アイテムをビルド
      itemBuilder: (context, index) {
        return widget.items[index];
      },
    );
  }
}
