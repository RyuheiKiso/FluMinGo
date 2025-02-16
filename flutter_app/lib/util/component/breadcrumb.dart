import 'package:flutter/material.dart';

// パンくずリストコンポーネント
class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final Color activeColor;
  final Color inactiveColor;

  const Breadcrumb({super.key, 
    required this.items,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.map((item) => _buildItem(item)).toList(),
    );
  }

  Widget _buildItem(BreadcrumbItem item) {
    return Row(
      children: [
        GestureDetector(
          onTap: item.onTap,
          child: Text(
            item.label,
            style: TextStyle(
              color: item.isActive ? activeColor : inactiveColor,
            ),
          ),
        ),
        if (item != items.last) Icon(Icons.chevron_right, color: inactiveColor),
      ],
    );
  }
}

class BreadcrumbItem {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  BreadcrumbItem({
    required this.label,
    this.isActive = false,
    required this.onTap,
  });
}
