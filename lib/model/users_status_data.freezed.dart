// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_status_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersStatusData _$UsersStatusDataFromJson(Map<String, dynamic> json) {
  return _UsersStatusData.fromJson(json);
}

/// @nodoc
mixin _$UsersStatusData {
  String? get uuid => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  int? get nextLevel => throw _privateConstructorUsedError;
  int? get totalPoint => throw _privateConstructorUsedError;
  int? get totalMonster => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersStatusDataCopyWith<UsersStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStatusDataCopyWith<$Res> {
  factory $UsersStatusDataCopyWith(
          UsersStatusData value, $Res Function(UsersStatusData) then) =
      _$UsersStatusDataCopyWithImpl<$Res, UsersStatusData>;
  @useResult
  $Res call(
      {String? uuid,
      int? level,
      int? nextLevel,
      int? totalPoint,
      int? totalMonster});
}

/// @nodoc
class _$UsersStatusDataCopyWithImpl<$Res, $Val extends UsersStatusData>
    implements $UsersStatusDataCopyWith<$Res> {
  _$UsersStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? level = freezed,
    Object? nextLevel = freezed,
    Object? totalPoint = freezed,
    Object? totalMonster = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      nextLevel: freezed == nextLevel
          ? _value.nextLevel
          : nextLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPoint: freezed == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      totalMonster: freezed == totalMonster
          ? _value.totalMonster
          : totalMonster // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersStatusDataImplCopyWith<$Res>
    implements $UsersStatusDataCopyWith<$Res> {
  factory _$$UsersStatusDataImplCopyWith(_$UsersStatusDataImpl value,
          $Res Function(_$UsersStatusDataImpl) then) =
      __$$UsersStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uuid,
      int? level,
      int? nextLevel,
      int? totalPoint,
      int? totalMonster});
}

/// @nodoc
class __$$UsersStatusDataImplCopyWithImpl<$Res>
    extends _$UsersStatusDataCopyWithImpl<$Res, _$UsersStatusDataImpl>
    implements _$$UsersStatusDataImplCopyWith<$Res> {
  __$$UsersStatusDataImplCopyWithImpl(
      _$UsersStatusDataImpl _value, $Res Function(_$UsersStatusDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = freezed,
    Object? level = freezed,
    Object? nextLevel = freezed,
    Object? totalPoint = freezed,
    Object? totalMonster = freezed,
  }) {
    return _then(_$UsersStatusDataImpl(
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      nextLevel: freezed == nextLevel
          ? _value.nextLevel
          : nextLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPoint: freezed == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      totalMonster: freezed == totalMonster
          ? _value.totalMonster
          : totalMonster // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsersStatusDataImpl
    with DiagnosticableTreeMixin
    implements _UsersStatusData {
  const _$UsersStatusDataImpl(
      {this.uuid,
      this.level,
      this.nextLevel,
      this.totalPoint,
      this.totalMonster});

  factory _$UsersStatusDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsersStatusDataImplFromJson(json);

  @override
  final String? uuid;
  @override
  final int? level;
  @override
  final int? nextLevel;
  @override
  final int? totalPoint;
  @override
  final int? totalMonster;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsersStatusData(uuid: $uuid, level: $level, nextLevel: $nextLevel, totalPoint: $totalPoint, totalMonster: $totalMonster)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UsersStatusData'))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('nextLevel', nextLevel))
      ..add(DiagnosticsProperty('totalPoint', totalPoint))
      ..add(DiagnosticsProperty('totalMonster', totalMonster));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersStatusDataImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.nextLevel, nextLevel) ||
                other.nextLevel == nextLevel) &&
            (identical(other.totalPoint, totalPoint) ||
                other.totalPoint == totalPoint) &&
            (identical(other.totalMonster, totalMonster) ||
                other.totalMonster == totalMonster));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, level, nextLevel, totalPoint, totalMonster);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersStatusDataImplCopyWith<_$UsersStatusDataImpl> get copyWith =>
      __$$UsersStatusDataImplCopyWithImpl<_$UsersStatusDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsersStatusDataImplToJson(
      this,
    );
  }
}

abstract class _UsersStatusData implements UsersStatusData {
  const factory _UsersStatusData(
      {final String? uuid,
      final int? level,
      final int? nextLevel,
      final int? totalPoint,
      final int? totalMonster}) = _$UsersStatusDataImpl;

  factory _UsersStatusData.fromJson(Map<String, dynamic> json) =
      _$UsersStatusDataImpl.fromJson;

  @override
  String? get uuid;
  @override
  int? get level;
  @override
  int? get nextLevel;
  @override
  int? get totalPoint;
  @override
  int? get totalMonster;
  @override
  @JsonKey(ignore: true)
  _$$UsersStatusDataImplCopyWith<_$UsersStatusDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
