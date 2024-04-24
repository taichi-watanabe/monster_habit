// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capture_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CaptureData _$CaptureDataFromJson(Map<String, dynamic> json) {
  return _CaptureData.fromJson(json);
}

/// @nodoc
mixin _$CaptureData {
  String? get name => throw _privateConstructorUsedError;
  String? get endAt => throw _privateConstructorUsedError;
  int? get taskP => throw _privateConstructorUsedError;
  String? get monsterUrl => throw _privateConstructorUsedError;
  int? get taskNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaptureDataCopyWith<CaptureData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaptureDataCopyWith<$Res> {
  factory $CaptureDataCopyWith(
          CaptureData value, $Res Function(CaptureData) then) =
      _$CaptureDataCopyWithImpl<$Res, CaptureData>;
  @useResult
  $Res call(
      {String? name,
      String? endAt,
      int? taskP,
      String? monsterUrl,
      int? taskNum});
}

/// @nodoc
class _$CaptureDataCopyWithImpl<$Res, $Val extends CaptureData>
    implements $CaptureDataCopyWith<$Res> {
  _$CaptureDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? endAt = freezed,
    Object? taskP = freezed,
    Object? monsterUrl = freezed,
    Object? taskNum = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
      taskP: freezed == taskP
          ? _value.taskP
          : taskP // ignore: cast_nullable_to_non_nullable
              as int?,
      monsterUrl: freezed == monsterUrl
          ? _value.monsterUrl
          : monsterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      taskNum: freezed == taskNum
          ? _value.taskNum
          : taskNum // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaptureDataImplCopyWith<$Res>
    implements $CaptureDataCopyWith<$Res> {
  factory _$$CaptureDataImplCopyWith(
          _$CaptureDataImpl value, $Res Function(_$CaptureDataImpl) then) =
      __$$CaptureDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? endAt,
      int? taskP,
      String? monsterUrl,
      int? taskNum});
}

/// @nodoc
class __$$CaptureDataImplCopyWithImpl<$Res>
    extends _$CaptureDataCopyWithImpl<$Res, _$CaptureDataImpl>
    implements _$$CaptureDataImplCopyWith<$Res> {
  __$$CaptureDataImplCopyWithImpl(
      _$CaptureDataImpl _value, $Res Function(_$CaptureDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? endAt = freezed,
    Object? taskP = freezed,
    Object? monsterUrl = freezed,
    Object? taskNum = freezed,
  }) {
    return _then(_$CaptureDataImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
      taskP: freezed == taskP
          ? _value.taskP
          : taskP // ignore: cast_nullable_to_non_nullable
              as int?,
      monsterUrl: freezed == monsterUrl
          ? _value.monsterUrl
          : monsterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      taskNum: freezed == taskNum
          ? _value.taskNum
          : taskNum // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaptureDataImpl with DiagnosticableTreeMixin implements _CaptureData {
  const _$CaptureDataImpl(
      {this.name, this.endAt, this.taskP, this.monsterUrl, this.taskNum});

  factory _$CaptureDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaptureDataImplFromJson(json);

  @override
  final String? name;
  @override
  final String? endAt;
  @override
  final int? taskP;
  @override
  final String? monsterUrl;
  @override
  final int? taskNum;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CaptureData(name: $name, endAt: $endAt, taskP: $taskP, monsterUrl: $monsterUrl, taskNum: $taskNum)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CaptureData'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('endAt', endAt))
      ..add(DiagnosticsProperty('taskP', taskP))
      ..add(DiagnosticsProperty('monsterUrl', monsterUrl))
      ..add(DiagnosticsProperty('taskNum', taskNum));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaptureDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.taskP, taskP) || other.taskP == taskP) &&
            (identical(other.monsterUrl, monsterUrl) ||
                other.monsterUrl == monsterUrl) &&
            (identical(other.taskNum, taskNum) || other.taskNum == taskNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, endAt, taskP, monsterUrl, taskNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaptureDataImplCopyWith<_$CaptureDataImpl> get copyWith =>
      __$$CaptureDataImplCopyWithImpl<_$CaptureDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaptureDataImplToJson(
      this,
    );
  }
}

abstract class _CaptureData implements CaptureData {
  const factory _CaptureData(
      {final String? name,
      final String? endAt,
      final int? taskP,
      final String? monsterUrl,
      final int? taskNum}) = _$CaptureDataImpl;

  factory _CaptureData.fromJson(Map<String, dynamic> json) =
      _$CaptureDataImpl.fromJson;

  @override
  String? get name;
  @override
  String? get endAt;
  @override
  int? get taskP;
  @override
  String? get monsterUrl;
  @override
  int? get taskNum;
  @override
  @JsonKey(ignore: true)
  _$$CaptureDataImplCopyWith<_$CaptureDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
