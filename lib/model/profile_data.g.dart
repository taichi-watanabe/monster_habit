// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDataImpl _$$ProfileDataImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDataImpl(
      userName: json['userName'] as String,
      userJob: json['userJob'] as String,
      uuid: json['uuid'] as String?,
      userImageUrl: json['userImageUrl'] as String?,
      objectives: (json['objectives'] as List<dynamic>?)
          ?.map((e) => ObjectivesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      usersStatus: json['usersStatus'] == null
          ? null
          : UsersStatusData.fromJson(
              json['usersStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileDataImplToJson(_$ProfileDataImpl instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userJob': instance.userJob,
      'uuid': instance.uuid,
      'userImageUrl': instance.userImageUrl,
      'objectives': instance.objectives,
      'usersStatus': instance.usersStatus,
    };
