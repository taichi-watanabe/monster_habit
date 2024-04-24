// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capture_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaptureDataImpl _$$CaptureDataImplFromJson(Map<String, dynamic> json) =>
    _$CaptureDataImpl(
      name: json['name'] as String?,
      endAt: json['endAt'] as String?,
      taskP: json['taskP'] as int?,
      monsterUrl: json['monsterUrl'] as String?,
      taskNum: json['taskNum'] as int?,
    );

Map<String, dynamic> _$$CaptureDataImplToJson(_$CaptureDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'endAt': instance.endAt,
      'taskP': instance.taskP,
      'monsterUrl': instance.monsterUrl,
      'taskNum': instance.taskNum,
    };
