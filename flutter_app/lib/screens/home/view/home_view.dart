import 'package:flutter/material.dart';
import '../controller/home_controller.dart';
import '../model/home_model.dart';

// ホーム画面のビュー
class HomeView extends StatelessWidget {
  final HomeController controller;

  HomeView({super.key}) : controller = HomeController(HomeModel(data: ''));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('データ: ${controller.homeModel.data}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await controller.fetchData();
              },
              child: Text('データ取得'),
            ),
          ],
        ),
      ),
    );
  }
}