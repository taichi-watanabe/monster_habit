import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'users_status_data.freezed.dart';
part 'users_status_data.g.dart';

@freezed
class UsersStatusData with _$UsersStatusData {
  const factory UsersStatusData({
    String? uuid,
    int? level,
    int? nextLevel,
    int? totalPoint,
    int? totalMonster,
  }) = _UsersStatusData;

  factory UsersStatusData.fromJson(Map<String, dynamic> json) =>
      _$UsersStatusDataFromJson(json);
}
