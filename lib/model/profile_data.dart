import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:monster_habit/model/objectives_data.dart';

import 'package:monster_habit/model/users_status_data.dart';
part 'profile_data.freezed.dart';
part 'profile_data.g.dart';

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData(
      {required String userName,
      required String userJob,
      String? uuid,
      String? userImageUrl,
      List<ObjectivesData>? objectives,
      UsersStatusData? usersStatus}) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}
