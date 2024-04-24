// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_status_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsersStatusDataImpl _$$UsersStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UsersStatusDataImpl(
      uuid: json['uuid'] as String?,
      level: json['level'] as int?,
      nextLevel: json['nextLevel'] as int?,
      totalPoint: json['totalPoint'] as int?,
      totalMonster: json['totalMonster'] as int?,
    );

Map<String, dynamic> _$$UsersStatusDataImplToJson(
        _$UsersStatusDataImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'level': instance.level,
      'nextLevel': instance.nextLevel,
      'totalPoint': instance.totalPoint,
      'totalMonster': instance.totalMonster,
    };
