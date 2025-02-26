import 'package:flutter/material.dart';

// 概要: ツリーコンポーネント
// 目的: 階層構造のノードを表示する
// 使用方法: Tree(nodes: [TreeNode(label: 'ノード1'), TreeNode(label: 'ノード2')])

// ツリーコンポーネント
class Tree extends StatefulWidget {
  // ノードのリスト
  final List<TreeNode> nodes;
  final ValueChanged<TreeNode>? onNodeTap; // 新機能①
  final ValueChanged<TreeNode>? onNodeLongPress; // 新機能②

  const Tree({
    this.onNodeTap, // 新機能①
    this.onNodeLongPress, // 新機能②
    super.key,
    required this.nodes,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TreeState createState() => _TreeState();
}

class _TreeState extends State<Tree> {
  // 選択されたノードのセット
  final Set<TreeNode> _selectedNodes = {};

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.nodes.map((node) => _buildNode(node)).toList(),
    );
  }

  // ノードを構築するメソッド
  Widget _buildNode(TreeNode node) {
    final isSelected = _selectedNodes.contains(node);
    return ListTile(
      title: Text(node.label),
      selected: isSelected,
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedNodes.remove(node);
          } else {
            _selectedNodes.add(node);
          }
        });
        widget.onNodeTap?.call(node); // 新機能①
      },
      onLongPress: () {
        widget.onNodeLongPress?.call(node); // 新機能②
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
