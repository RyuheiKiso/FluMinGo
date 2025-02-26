// 概要: ネットワーク管理クラス
// 目的: ネットワークの状態を確認し、変化を監視する
// 使用方法: NetworkManager().isNetworkAvailable()

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager {
  final Connectivity _connectivity = Connectivity();

  Future<bool> isNetworkAvailable() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void listenNetworkChanges(Function(bool) onChange) {
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      onChange(result != ConnectivityResult.none);
    });
  }
}
