// main.dart ファイル
// このファイルは、Flutterアプリケーションのエントリーポイントを提供します。

import 'package:flutter/material.dart';
import 'util/theme/theme_manager.dart';
import 'util/user_preferences/user_preferences_manager.dart';
import 'dart:ui';

// main 関数
// アプリケーションのエントリーポイントです。
void main() {
  runApp(MyApp());
}

// MyApp クラス
// アプリケーションのルートウィジェットを定義します。
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

// GlassmorphismContainer クラス
// ガラスモーフィズム効果を持つコンテナを定義します。
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

// MyHomePage クラス
// ホームページのステートフルウィジェットを定義します。
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// _MyHomePageState クラス
// MyHomePageの状態を管理します。
class _MyHomePageState extends State<MyHomePage> {
  final UserPreferencesManager _preferencesManager = UserPreferencesManager();
  int _counter = 0;

  // _incrementCounter 関数
  // カウンターをインクリメントします。
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
                // Use a logging framework instead of print
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
