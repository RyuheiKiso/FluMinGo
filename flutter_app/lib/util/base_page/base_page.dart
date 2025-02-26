import 'package:flutter/material.dart';

// Updated BasePage to be more abstract
abstract class BasePage extends StatelessWidget {
  const BasePage({super.key});

  // Abstract getter for title
  String get title;

  // Abstract method to build the body of the screen
  Widget buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: buildBody(context),
    );
  }
}
