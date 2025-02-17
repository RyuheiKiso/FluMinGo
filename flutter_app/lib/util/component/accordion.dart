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
  final String title;
  final Widget content;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final Icon? leadingIcon;
  final Duration animationDuration;
  final Curve animationCurve;
  final bool initiallyExpanded; // 新しいプロパティ

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
  const Accordion({
    required this.title,
    required this.content,
    this.titleStyle,
    this.contentStyle,
    this.leadingIcon,
    this.animationDuration = const Duration(milliseconds: 200),
    this.animationCurve = Curves.easeInOut,
    this.initiallyExpanded = false, // 新しいプロパティ
    super.key,
  });

  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late bool _isExpanded; // 初期化を遅延

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.animationCurve,
    );
    _isExpanded = widget.initiallyExpanded; // 初期状態を設定
    if (_isExpanded) {
      _controller.value = 1.0; // 初期状態で展開
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: widget.leadingIcon,
          title: Text(widget.title, style: widget.titleStyle),
          onTap: _handleTap,
        ),
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
