import '../model/login_model.dart';

// ログイン画面のコントローラークラス
class LoginController {
  // ログインモデルのインスタンス
  final LoginModel model;

  // コンストラクタ
  LoginController(this.model);

  // ログイン処理
  Future<void> login() async {
    // ここにログイン処理を実装する
    // 例: API呼び出し、バリデーションなど
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