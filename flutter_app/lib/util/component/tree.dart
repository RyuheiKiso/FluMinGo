import 'package:flutter/material.dart';

// ツリーコンポーネント
class Tree extends StatefulWidget {
  // ノードのリスト
  final List<TreeNode> nodes;
  const Tree({super.key, required this.nodes});

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