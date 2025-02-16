import 'package:flutter/material.dart';

// ドロワーコンポーネント
class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'メニュー',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('ホーム'),
            onTap: () {
              // ホーム画面に遷移する処理を実装
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('検索'),
            onTap: () {
              // 検索画面に遷移する処理を実装
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('プロフィール'),
            onTap: () {
              // プロフィール画面に遷移する処理を実装
            },
          ),
        ],
      ),
    );
  }
}