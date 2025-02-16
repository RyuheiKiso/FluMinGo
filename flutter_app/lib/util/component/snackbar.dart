import 'package:flutter/material.dart';

// スナックバーコンポーネント
class SnackbarComponent {
  final String message;

  SnackbarComponent({required this.message});

  void show(BuildContext context) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
