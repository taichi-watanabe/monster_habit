import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'capture_data.freezed.dart';
part 'capture_data.g.dart';

@freezed
class CaptureData with _$CaptureData {
  const factory CaptureData(
      {String? name,
      String? endAt,
      int? taskP,
      String? monsterUrl,
      int? taskNum}) = _CaptureData;

  factory CaptureData.fromJson(Map<String, dynamic> json) =>
      _$CaptureDataFromJson(json);

  static List<CaptureData> toList(List<dynamic>? json) {
    List<CaptureData> _list = [];
    if (json == null) return _list;
    if (json.isEmpty) return _list;

    for (var capture in json) {
      var _captureMap = capture as Map<String, dynamic>;
      var _capture = CaptureData.fromJson(_captureMap);
      _list.add(_capture);
    }
    return _list;
  }
}
