import 'package:flutter/material.dart';

// カスタムツリービューコンポーネント
class TreeView extends StatefulWidget {
  // ノードのリスト
  final List<TreeNode> nodes;
  TreeView({required this.nodes});

  @override
  _TreeViewState createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  // 展開されたノードのマップ
  final Map<TreeNode, bool> _expandedNodes = {};

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.nodes.map((node) => _buildNode(node)).toList(),
    );
  }

  // ノードを構築するメソッド
  Widget _buildNode(TreeNode node) {
    final isExpanded = _expandedNodes[node] ?? false;
    return ExpansionTile(
      title: Text(node.label),
      children: node.children.map((child) => _buildNode(child)).toList(),
      initiallyExpanded: isExpanded,
      onExpansionChanged: (expanded) {
        setState(() {
          _expandedNodes[node] = expanded;
        });
      },
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
