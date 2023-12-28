import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile_data.freezed.dart';
part 'profile_data.g.dart';

@freezed
class ProfileData with _$ProfileData {
  const factory ProfileData({
    required String userName,
    required String userJob,
    required String uuid,
    required int userLevel,
    required int nextLevelPoint,
    required int life,
    String? profileImageUrl,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  static const initialData = ProfileData(
      userName: '',
      userJob: '',
      uuid: '',
      userLevel: 0,
      nextLevelPoint: 0,
      life: 3);
}
