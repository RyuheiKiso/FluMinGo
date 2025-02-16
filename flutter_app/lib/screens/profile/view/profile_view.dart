import 'package:flutter/material.dart';
import '../controller/profile_controller.dart';
import '../model/profile_model.dart';

// プロフィール画面のビュー
class ProfileView extends StatelessWidget {
  final ProfileController controller;

  ProfileView({super.key}) : controller = ProfileController(ProfileModel(username: '', email: ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'ユーザー名'),
              onChanged: (value) => controller.profileModel.username = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'メールアドレス'),
              onChanged: (value) => controller.profileModel.email = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.fetchProfile();
              },
              child: Text('プロフィール取得'),
            ),
          ],
        ),
      ),
    );
  }
}