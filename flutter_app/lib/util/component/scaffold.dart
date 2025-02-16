import 'package:flutter/material.dart';

// スキャフォールドコンポーネント
class ScaffoldComponent extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;

  const ScaffoldComponent({super.key, required this.title, required this.body, this.floatingActionButton, this.bottomNavigationBar, this.drawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
    );
  }
}