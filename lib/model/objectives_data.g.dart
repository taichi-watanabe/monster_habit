// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objectives_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ObjectivesDataImpl _$$ObjectivesDataImplFromJson(Map<String, dynamic> json) =>
    _$ObjectivesDataImpl(
      uuid: json['uuid'] as String?,
      id: json['id'] as int?,
      archivementPoint: json['archivementPoint'] as int? ?? 0,
      totalPoint: json['totalPoint'] as int? ?? 0,
      mokuhyoTitle: json['mokuhyoTitle'] as String?,
      monsterUrl: json['monsterUrl'] as String?,
      mokuhyoMemo: json['mokuhyoMemo'] as String?,
      taskCount: json['taskCount'] as int?,
      beginAt: json['beginAt'] as String?,
      endAt: json['endAt'] as String?,
      status: $enumDecodeNullable(_$ObjectiveStatusTypeEnumMap, json['status']),
      deadline: json['deadline'] as String?,
    );

Map<String, dynamic> _$$ObjectivesDataImplToJson(
        _$ObjectivesDataImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'id': instance.id,
      'archivementPoint': instance.archivementPoint,
      'totalPoint': instance.totalPoint,
      'mokuhyoTitle': instance.mokuhyoTitle,
      'monsterUrl': instance.monsterUrl,
      'mokuhyoMemo': instance.mokuhyoMemo,
      'taskCount': instance.taskCount,
      'beginAt': instance.beginAt,
      'endAt': instance.endAt,
      'status': _$ObjectiveStatusTypeEnumMap[instance.status],
      'deadline': instance.deadline,
    };

const _$ObjectiveStatusTypeEnumMap = {
  ObjectiveStatusType.running: 'running',
  ObjectiveStatusType.achievement: 'achievement',
  ObjectiveStatusType.failure: 'failure',
};
