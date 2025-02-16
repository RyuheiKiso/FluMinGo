// ホーム画面のモデル
class HomeModel {
  // サンプルデータ
  String data;

  HomeModel({required this.data});

  // JSONからHomeModelを生成するファクトリーメソッド
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      data: json['data'],
    );
  }

  // HomeModelをJSONに変換するメソッド
  Map<String, dynamic> toJson() {
    return {
      'data': data,
    };
  }
}