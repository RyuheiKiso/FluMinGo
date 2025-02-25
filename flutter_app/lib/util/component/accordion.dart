import 'package:flutter/material.dart';

/// アコーディオンコンポーネント
/// 
/// [Accordion]はタイトルとコンテンツを展開可能なリストとして表示します。
/// 
/// ```dart
/// Accordion(
///   title: 'タイトル',
///   content: Text('コンテンツ'),
/// )
/// ```
class Accordion extends StatefulWidget {
  // タイトル
  final String title;
  // コンテンツ
  final Widget content;
  // タイトルのスタイル
  final TextStyle? titleStyle;
  // コンテンツのスタイル
  final TextStyle? contentStyle;
  // タイトルの前に表示するアイコン
  final Icon? leadingIcon;
  // アニメーションの時間
  final Duration animationDuration;
  // アニメーションのカーブ
  final Curve animationCurve;
  // 初期状態で展開されているかどうか
  final bool initiallyExpanded; // 新しいプロパティ
  // 新しいプロパティ
  final double? iconSize;
  final double? labelFontSize;

  /// コンストラクタ
  /// 
  /// [title]はアコーディオンのタイトルを指定します。
  /// [content]はアコーディオンのコンテンツを指定します。
  /// [titleStyle]はタイトルのスタイルを指定します。
  /// [contentStyle]はコンテンツのスタイルを指定します。
  /// [leadingIcon]はタイトルの前に表示するアイコンを指定します。
  /// [animationDuration]はアコーディオンの展開/折りたたみのアニメーションの時間を指定します。
  /// [animationCurve]はアニメーションのカーブを指定します。
  /// [initiallyExpanded]は初期状態で展開されているかどうかを指定します。
  /// [iconSize]はアイコンのサイズを指定します。
  /// [labelFontSize]はラベルのフォントサイズを指定します。
  const Accordion({
    required this.title,
    required this.content,
    this.titleStyle,
    this.contentStyle,
    this.leadingIcon,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.initiallyExpanded = false, // 新しいプロパティ
    this.iconSize,
    this.labelFontSize,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> with SingleTickerProviderStateMixin {
  // アニメーションコントローラ
  late AnimationController _controller;
  // アニメーション
  late Animation<double> _animation;
  // 展開状態
  late bool _isExpanded; // 初期化を遅延

  @override
  void initState() {
    super.initState();
    // アニメーションコントローラの初期化
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    // アニメーションの初期化
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve,
    );
    // 初期状態を設定
    _isExpanded = widget.initiallyExpanded; 
    if (_isExpanded) {
      // 初期状態で展開
      _controller.value = 1.0; 
    }
  }

  @override
  void dispose() {
    // アニメーションコントローラの破棄
    _controller.dispose();
    super.dispose();
  }

  // タップ時の処理
  void _handleTap() {
    setState(() {
      // 展開状態を反転
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        // 展開アニメーション
        _controller.forward();
      } else {
        // 折りたたみアニメーション
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // タイトル部分
        ListTile(
          leading: widget.leadingIcon != null
              ? Icon(
                  widget.leadingIcon!.icon,
                  size: widget.iconSize,
                )
              : null,
          title: Text(
            widget.title,
            style: widget.titleStyle?.copyWith(fontSize: widget.labelFontSize),
          ),
          onTap: _handleTap,
        ),
        // コンテンツ部分
        SizeTransition(
          sizeFactor: _animation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DefaultTextStyle(
              style: widget.contentStyle ?? TextStyle(),
              child: widget.content,
            ),
          ),
        ),
      ],
    );
  }
}
