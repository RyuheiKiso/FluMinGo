import 'package:geolocator/geolocator.dart';

class LocationManager {
  // 位置情報の基本機能を実装

  Future<Position> getCurrentLocation() async {
    // 現在の位置情報を取得する処理
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  void listenLocationChanges(Function(Position) onChange) {
    // 位置情報の変化を監視する処理
    Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    ).listen((Position position) {
      onChange(position);
    });
  }
}
