// ログイン画面のモデル
class LoginModel {
  // ユーザー名
  String username;
  // パスワード
  String password;

  LoginModel({required this.username, required this.password});

  // JSONからLoginModelを生成するファクトリーメソッド
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      username: json['username'],
      password: json['password'],
    );
  }

  // LoginModelをJSONに変換するメソッド
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}