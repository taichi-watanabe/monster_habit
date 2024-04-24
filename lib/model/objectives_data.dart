import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:monster_habit/model/enum/objective_status_type.dart';

part 'objectives_data.freezed.dart';
part 'objectives_data.g.dart';

@freezed
class ObjectivesData with _$ObjectivesData {
  const factory ObjectivesData({
    String? uuid,
    int? id,
    @Default(0) int archivementPoint,
    @Default(0) int totalPoint,
    String? mokuhyoTitle,
    String? monsterUrl,
    String? mokuhyoMemo,
    int? taskCount,
    String? beginAt,
    String? endAt,
    ObjectiveStatusType? status,
    String? deadline,
  }) = _ObjectivesData;

  factory ObjectivesData.fromJson(Map<String, dynamic> json) =>
      _$ObjectivesDataFromJson(json);

  static List<ObjectivesData> toList(List<dynamic>? json) {
    List<ObjectivesData> _list = [];
    if (json == null) return _list;
    if (json.isEmpty) return _list;

    for (var mokuhyo in json) {
      var _mokuhyoMap = mokuhyo as Map<String, dynamic>;
      var _mokuhyo = ObjectivesData.fromJson(_mokuhyoMap);
      _list.add(_mokuhyo);
    }
    return _list;
  }
}

extension ObjectivesDataExtension on ObjectivesData {
  Map<String, dynamic> createMap() {
    final Map<String, dynamic> result = {};
    result.addAll(ObjectivesData(
            archivementPoint: archivementPoint,
            totalPoint: totalPoint,
            mokuhyoTitle: mokuhyoTitle,
            monsterUrl: monsterUrl,
            mokuhyoMemo: mokuhyoMemo,
            beginAt: beginAt,
            taskCount: taskCount,
            endAt: endAt,
            status: status,
            deadline: deadline)
        .toJson());

    return result;
  }
}
