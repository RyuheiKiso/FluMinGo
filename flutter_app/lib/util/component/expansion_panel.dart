import 'package:flutter/material.dart';

/// カスタムエクスパンションパネル
/// 
/// [CustomExpansionPanel]はタイトルとコンテンツを受け取るカスタムエクスパンションパネルウィジェットです。
/// 
/// ```dart
/// CustomExpansionPanel(
///   title: 'タイトル',
///   content: Text('コンテンツ'),
/// )
/// ```
class CustomExpansionPanel extends StatelessWidget {
  final String title;
  final Widget content;

  /// コンストラクタ
  /// 
  /// [title] エクスパンションパネルのタイトル
  /// [content] エクスパンションパネルのコンテンツ
  const CustomExpansionPanel({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        // パネルの展開状態を切り替える
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(title),
            );
          },
          body: content,
          isExpanded: false,
        ),
      ],
    );
  }
}
