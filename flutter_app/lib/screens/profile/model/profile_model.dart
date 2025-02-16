// プロフィール画面のモデル
class ProfileModel {
  // ユーザー名
  String username;
  // メールアドレス
  String email;

  ProfileModel({required this.username, required this.email});

  // JSONからProfileModelを生成するファクトリーメソッド
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      username: json['username'],
      email: json['email'],
    );
  }

  // ProfileModelをJSONに変換するメソッド
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }
}