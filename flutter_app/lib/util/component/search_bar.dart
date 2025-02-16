import 'package:flutter/material.dart';

// サーチバーコンポーネント
class SearchBarComponent extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const SearchBarComponent({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}