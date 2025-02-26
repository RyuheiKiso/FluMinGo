import 'package:flutter/material.dart';

// 概要: カスタムモーダルコンポーネント
// 目的: モーダルダイアログを表示する
// 使用方法: ModalComponent(
//   title: 'タイトル',
//   content: Text('コンテンツ'),
//   actions: [TextButton(onPressed: () {}, child: Text('閉じる'))],
// )

// モーダルコンポーネント
class ModalComponent extends StatelessWidget {
  // モーダルのコンテンツ
  final Widget content;
  // モーダルのタイトル
  final String title;
  // アクションボタン
  final List<Widget>? actions;
  // バックグラウンドカラー
  final Color? backgroundColor;
  // シェイプ
  final ShapeBorder? shape;
  // モーダルの高さ
  final double? height;
  // モーダルの幅
  final double? width;
  // モーダルのアニメーションの有効/無効
  final bool enableAnimation;

  const ModalComponent({
    super.key,
    required this.content,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.shape,
    this.height,
    this.width,
    this.enableAnimation = true,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: shape,
      backgroundColor: backgroundColor,
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // タイトルの表示
            Text(title),
            // コンテンツの表示
            content,
            // アクションボタンの表示
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:
                  actions ??
                  [
                    TextButton(
                      child: Text('閉じる'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
            ),
          ],
        ),
      ),
    );
  }
}
