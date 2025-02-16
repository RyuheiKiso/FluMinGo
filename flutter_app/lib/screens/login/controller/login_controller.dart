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
    if (model.username == 'test' && model.password == 'test') {
      // テストモードとして認証成功
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // ここに通常のログイン処理を実装する
      // 例: API呼び出し、バリデーションなど
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