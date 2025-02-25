import 'package:flutter/material.dart';

// カスタムツリービューコンポーネント
class TreeView extends StatefulWidget {
  // ノードのリスト
  final List<TreeNode> nodes;
  final double indent; // 新機能②

  const TreeView({
    super.key,
    required this.nodes,
    this.indent = 16.0, // 新機能②
  });

  @override
  // ignore: library_private_types_in_public_api
  _TreeViewState createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  // 展開されたノードのマップ
  final Map<TreeNode, bool> _expandedNodes = {};

  void _toggleAll(bool expand) { // 新機能①
    setState(() {
      for (var node in widget.nodes) {
        _expandedNodes[node] = expand;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row( // 新機能①ボタン群
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () => _toggleAll(true), child: Text('Expand All')),
            TextButton(onPressed: () => _toggleAll(false), child: Text('Collapse All')),
          ],
        ),
        Expanded(
          child: ListView(
            children: widget.nodes.map((node) => _buildNode(node)).toList(),
          ),
        ),
      ],
    );
  }

  // ノードを構築するメソッド
  Widget _buildNode(TreeNode node) {
    final isExpanded = _expandedNodes[node] ?? false;
    return Padding(
      padding: EdgeInsets.only(left: widget.indent), // 新機能②
      child: ExpansionTile(
        title: Text(node.label),
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            _expandedNodes[node] = expanded;
          });
        },
        children: node.children.map((child) => _buildNode(child)).toList(),
      ),
    );
  }
}

// ツリーノードクラス
class TreeNode {
  // ノードのラベル
  final String label;
  // 子ノードのリスト
  final List<TreeNode> children;
  TreeNode({required this.label, this.children = const []});
}
