import 'package:flutter/material.dart';

// ツリーコンポーネント
class TreeComponent extends StatelessWidget {
  final List<Widget> nodes;

  const TreeComponent({super.key, required this.nodes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: nodes,
    );
  }
}