// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mokuhyo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MokuhyoData _$$_MokuhyoDataFromJson(Map<String, dynamic> json) =>
    _$_MokuhyoData(
      mokuhyoTitle: json['mokuhyoTitle'] as String,
      mokuhyoMemo: json['mokuhyoMemo'] as String?,
      mokuhyoPoint: (json['mokuhyoPoint'] as num).toDouble(),
      monsterUrl: json['monsterUrl'] as String,
      begin_at: DateTime.parse(json['begin_at'] as String),
      end_at: json['end_at'] == null
          ? null
          : DateTime.parse(json['end_at'] as String),
      monsterName: json['monsterName'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_MokuhyoDataToJson(_$_MokuhyoData instance) =>
    <String, dynamic>{
      'mokuhyoTitle': instance.mokuhyoTitle,
      'mokuhyoMemo': instance.mokuhyoMemo,
      'mokuhyoPoint': instance.mokuhyoPoint,
      'monsterUrl': instance.monsterUrl,
      'begin_at': instance.begin_at.toIso8601String(),
      'end_at': instance.end_at?.toIso8601String(),
      'monsterName': instance.monsterName,
      'status': instance.status,
    };
