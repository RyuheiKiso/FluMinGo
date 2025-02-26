// 概要: Flutterアプリケーションのエントリーポイント
// 目的: アプリケーションのルートウィジェットを提供する
// 使用方法: main() 関数を呼び出してアプリケーションを起動する

import 'package:flutter/material.dart';
import 'util/theme/theme_manager.dart';
import 'util/user_preferences/user_preferences_manager.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeManager _themeManager = ThemeManager();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _themeManager.getThemeData('light'),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class GlassmorphismContainer extends StatelessWidget {
  final Widget child;
  const GlassmorphismContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withAlpha(25),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: child,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final UserPreferencesManager _preferencesManager = UserPreferencesManager();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary.withAlpha(25),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () async {
                await _preferencesManager.savePreference('key', 'value');
              },
              child: const Text('Save Preference'),
            ),
            ElevatedButton(
              onPressed: () async {
                String? value = await _preferencesManager.getPreference('key');
                debugPrint('Retrieved value: $value');
              },
              child: const Text('Get Preference'),
            ),
            ElevatedButton(
              onPressed: () async {
                await _preferencesManager.removePreference('key');
              },
              child: const Text('Remove Preference'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
