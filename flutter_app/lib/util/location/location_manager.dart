// 概要: 位置情報管理クラス
// 目的: 現在の位置情報を取得し、位置情報の変化を監視する
// 使用方法: LocationManager().getCurrentLocation()

import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class LocationManager {
  final Logger _logger = Logger();

  Future<Position> getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e, stackTrace) {
      _logger.e('Error retrieving current location', e, stackTrace);
      rethrow;
    }
  }

  void listenLocationChanges(Function(Position) onChange) {
    Geolocator.getPositionStream(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
    ).listen((Position position) {
      try {
        onChange(position);
      } catch (e, stackTrace) {
        _logger.e('Error in location update callback', e, stackTrace);
      }
    }, onError: (error, stackTrace) {
      _logger.e('Error in location stream', error, stackTrace);
    });
  }
}
