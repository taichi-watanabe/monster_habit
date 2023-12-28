// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileData _$$_ProfileDataFromJson(Map<String, dynamic> json) =>
    _$_ProfileData(
      userName: json['userName'] as String,
      userJob: json['userJob'] as String,
      uuid: json['uuid'] as String,
      userLevel: json['userLevel'] as int,
      nextLevelPoint: json['nextLevelPoint'] as int,
      life: json['life'] as int,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$_ProfileDataToJson(_$_ProfileData instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userJob': instance.userJob,
      'uuid': instance.uuid,
      'userLevel': instance.userLevel,
      'nextLevelPoint': instance.nextLevelPoint,
      'life': instance.life,
      'profileImageUrl': instance.profileImageUrl,
    };
