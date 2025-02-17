import 'package:flutter/material.dart';

// ツリーコンポーネント
class Tree extends StatefulWidget {
  final List<TreeNode> nodes;
  Tree({required this.nodes});

  @override
  _TreeState createState() => _TreeState();
}

class _TreeState extends State<Tree> {
  final Set<TreeNode> _selectedNodes = {};

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.nodes.map((node) => _buildNode(node)).toList(),
    );
  }

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

class TreeNode {
  final String label;
  final List<TreeNode> children;
  TreeNode({required this.label, this.children = const []});
}