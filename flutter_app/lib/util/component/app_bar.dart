import 'package:flutter/material.dart';

// アプリバーコンポーネント
class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}