import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// トーストメッセージコンポーネント
class CustomToast {
  // トーストメッセージを表示するメソッド
  static void showToast(String message, {ToastGravity gravity = ToastGravity.BOTTOM, Color backgroundColor = Colors.black, Color textColor = Colors.white}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}

class Toast {
  // トーストメッセージを表示するメソッド
  static void show(BuildContext context, String message, {Duration duration = const Duration(seconds: 2), double bottomOffset = 50.0, Color backgroundColor = Colors.black, Color textColor = Colors.white}) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: bottomOffset,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: backgroundColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}
