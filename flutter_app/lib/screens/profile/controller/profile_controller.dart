import '../model/profile_model.dart';

// プロフィール画面のコントローラー
class ProfileController {
  // プロフィールモデルのインスタンス
  ProfileModel profileModel;

  ProfileController(this.profileModel);

  // プロフィール情報を取得するメソッド
  Future<void> fetchProfile() async {
    // ここにプロフィール情報取得処理を実装する
    // 例: API呼び出しなど
  }

  // ユーザー名を更新する
  void updateUsername(String username) {
    profileModel.username = username;
  }

  // メールアドレスを更新する
  void updateEmail(String email) {
    profileModel.email = email;
  }
}