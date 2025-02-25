import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager {
  // ネットワーク状態の基本機能を実装

  final Connectivity _connectivity = Connectivity();

  Future<bool> isNetworkAvailable() async {
    // ネットワークの状態をチェックする処理
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void listenNetworkChanges(Function(bool) onChange) {
    // ネットワークの変化を監視する処理
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      onChange(result != ConnectivityResult.none);
    });
  }
}