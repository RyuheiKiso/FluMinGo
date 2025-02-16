import 'package:flutter/material.dart';
import 'package:flutter_app/util/component/glassmorphism_container.dart'; // Correct import path
import '../controller/login_controller.dart';
import '../model/login_model.dart';

// ログイン画面のビュー
class LoginView extends StatelessWidget {
  final LoginController controller;

  LoginView({super.key}) : controller = LoginController(LoginModel(username: '', password: ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: Center(
        child: GlassmorphismContainer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'ユーザー名'),
                  onChanged: (value) => controller.model.username = value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'パスワード'),
                  obscureText: true,
                  onChanged: (value) => controller.model.password = value,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await controller.login(context);
                  },
                  child: Text('ログイン'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}