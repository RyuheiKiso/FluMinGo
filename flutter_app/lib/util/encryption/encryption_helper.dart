import 'package:encrypt/encrypt.dart';

// 暗号化ヘルパー
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