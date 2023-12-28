import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'mokuhyo_data.freezed.dart';
part 'mokuhyo_data.g.dart';

@freezed
class MokuhyoData with _$MokuhyoData {
  const factory MokuhyoData({
    required String mokuhyoTitle,
    String? mokuhyoMemo,
    required double mokuhyoPoint,
    required String monsterUrl,
    required DateTime begin_at,
    DateTime? end_at,
    String? monsterName,
    required String status,
  }) = _MokuhyoData;

  factory MokuhyoData.fromJson(Map<String, dynamic> json) =>
      _$MokuhyoDataFromJson(json);

  static List<MokuhyoData> toList(List<dynamic>? json) {
    List<MokuhyoData> _list = [];
    if (json == null) return _list;
    if (json.isEmpty) return _list;

    for (var mokuhyo in json) {
      var _mokuhyoMap = mokuhyo as Map<String, dynamic>;
      var _mokuhyo = MokuhyoData.fromJson(_mokuhyoMap);
      _list.add(_mokuhyo);
    }
    return _list;
  }
}
