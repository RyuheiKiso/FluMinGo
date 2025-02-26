// 概要: 暗号化ヘルパー
// 目的: 暗号化と復号化の処理を実装し、安全なデータ管理を目的としています。
// 使用方法: 必要な暗号化・復号化の関数をインポートして利用してください。

library;

import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  final Key key;
  final IV iv;

  EncryptionHelper({required this.key, required this.iv});

  // 文字列を暗号化するメソッド
  String encrypt(String text) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(text, iv: iv);
    return encrypted.base64;
  }

  // 文字列を復号化するメソッド
  String decrypt(String encryptedText) {
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}
