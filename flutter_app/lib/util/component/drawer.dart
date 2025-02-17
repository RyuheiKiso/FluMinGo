import 'package:flutter/material.dart';

// ドロワーコンポーネント
class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Drawerヘッダーの追加
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            // ヘッダーのデコレーション
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
            // ホーム画面に遷移する処理を実装
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('検索'),
            // 検索画面に遷移する処理を実装
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('プロフィール'),
            // プロフィール画面に遷移する処理を実装
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          // 新しいメニューアイテムの追加
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            // 設定画面へのナビゲーション
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            // ヘルプ画面へのナビゲーション
            onTap: () {
              Navigator.pushNamed(context, '/help');
            },
          ),
          // ログアウトメニューアイテムの追加
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('ログアウト'),
            // ログアウト処理を実装
            onTap: () {
              Navigator.pushNamed(context, '/logout');
            },
          ),
        ],
      ),
    );
  }
}