// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDataImpl _$$TaskDataImplFromJson(Map<String, dynamic> json) =>
    _$TaskDataImpl(
      taskTitle: json['taskTitle'] as String?,
      status: json['status'] as String?,
      exPoint: (json['exPoint'] as num?)?.toDouble(),
      objectiveId: json['objectiveId'] as int?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$TaskDataImplToJson(_$TaskDataImpl instance) =>
    <String, dynamic>{
      'taskTitle': instance.taskTitle,
      'status': instance.status,
      'exPoint': instance.exPoint,
      'objectiveId': instance.objectiveId,
      'id': instance.id,
    };
