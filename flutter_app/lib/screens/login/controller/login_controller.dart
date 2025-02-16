import '../model/login_model.dart';
import 'package:flutter/material.dart';

// ログイン画面のコントローラークラス
class LoginController {
  // ログインモデルのインスタンス
  final LoginModel model;

  // コンストラクタ
  LoginController(this.model);

  // ログイン処理
  Future<void> login(BuildContext context) async {
    if (model.username.isEmpty || model.password.isEmpty) {
      // ユーザーIDまたはパスワードが未入力の場合にスナックバーでエラーメッセージを表示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ユーザーIDとパスワードを入力してください。')),
      );
      return;
    }
    if (model.username == 'test' && model.password == 'test') {
      // テストモードとして認証成功
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // ここに通常のログイン処理を実装する
      // 例: API呼び出し、バリデーションなど
      // ログイン失敗時にスナックバーでエラーメッセージを表示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ログインに失敗しました。ユーザー名またはパスワードが間違っています。')),
      );
    }
  }

  // ユーザー名を更新する
  void updateUsername(String username) {
    model.username = username;
  }

  // パスワードを更新する
  void updatePassword(String password) {
    model.password = password;
  }
}