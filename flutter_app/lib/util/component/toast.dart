import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 概要: トーストメッセージコンポーネント
// 目的: 短時間表示されるメッセージを提供する
// 使用方法: CustomToast.showToast('メッセージ')

// トーストメッセージコンポーネント
class CustomToast {
  // トーストメッセージを表示するメソッド
  static void showToast(
    String message, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    double bottomOffset = 50.0, // 新機能①
    VoidCallback? onToastHide, // 新機能②
  }) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
    Future.delayed(Duration(seconds: 2), () {
      onToastHide?.call(); // 新機能②
    });
  }
}

class Toast {
  // トーストメッセージを表示するメソッド
  static void show(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
    double bottomOffset = 50.0,
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    VoidCallback? onToastHide, // 新機能②
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            bottom: bottomOffset, // 新機能①（既存 bottomOffset 使用）
            left: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: backgroundColor.withAlpha(
                    179,
                  ), // Replace deprecated 'withOpacity' with 'withAlpha'
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(message, style: TextStyle(color: textColor)),
              ),
            ),
          ),
    );
    overlay.insert(overlayEntry);
    Future.delayed(duration, () {
      overlayEntry.remove();
      onToastHide?.call(); // 新機能②
    });
  }
}
