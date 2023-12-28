// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  String get userName => throw _privateConstructorUsedError;
  String get userJob => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  int get userLevel => throw _privateConstructorUsedError;
  int get nextLevelPoint => throw _privateConstructorUsedError;
  int get life => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) then) =
      _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call(
      {String userName,
      String userJob,
      String uuid,
      int userLevel,
      int nextLevelPoint,
      int life,
      String? profileImageUrl});
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userJob = null,
    Object? uuid = null,
    Object? userLevel = null,
    Object? nextLevelPoint = null,
    Object? life = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userJob: null == userJob
          ? _value.userJob
          : userJob // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      userLevel: null == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as int,
      nextLevelPoint: null == nextLevelPoint
          ? _value.nextLevelPoint
          : nextLevelPoint // ignore: cast_nullable_to_non_nullable
              as int,
      life: null == life
          ? _value.life
          : life // ignore: cast_nullable_to_non_nullable
              as int,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileDataCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$_ProfileDataCopyWith(
          _$_ProfileData value, $Res Function(_$_ProfileData) then) =
      __$$_ProfileDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String userJob,
      String uuid,
      int userLevel,
      int nextLevelPoint,
      int life,
      String? profileImageUrl});
}

/// @nodoc
class __$$_ProfileDataCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$_ProfileData>
    implements _$$_ProfileDataCopyWith<$Res> {
  __$$_ProfileDataCopyWithImpl(
      _$_ProfileData _value, $Res Function(_$_ProfileData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userJob = null,
    Object? uuid = null,
    Object? userLevel = null,
    Object? nextLevelPoint = null,
    Object? life = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_$_ProfileData(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userJob: null == userJob
          ? _value.userJob
          : userJob // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      userLevel: null == userLevel
          ? _value.userLevel
          : userLevel // ignore: cast_nullable_to_non_nullable
              as int,
      nextLevelPoint: null == nextLevelPoint
          ? _value.nextLevelPoint
          : nextLevelPoint // ignore: cast_nullable_to_non_nullable
              as int,
      life: null == life
          ? _value.life
          : life // ignore: cast_nullable_to_non_nullable
              as int,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileData with DiagnosticableTreeMixin implements _ProfileData {
  const _$_ProfileData(
      {required this.userName,
      required this.userJob,
      required this.uuid,
      required this.userLevel,
      required this.nextLevelPoint,
      required this.life,
      this.profileImageUrl});

  factory _$_ProfileData.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileDataFromJson(json);

  @override
  final String userName;
  @override
  final String userJob;
  @override
  final String uuid;
  @override
  final int userLevel;
  @override
  final int nextLevelPoint;
  @override
  final int life;
  @override
  final String? profileImageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileData(userName: $userName, userJob: $userJob, uuid: $uuid, userLevel: $userLevel, nextLevelPoint: $nextLevelPoint, life: $life, profileImageUrl: $profileImageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileData'))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('userJob', userJob))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('userLevel', userLevel))
      ..add(DiagnosticsProperty('nextLevelPoint', nextLevelPoint))
      ..add(DiagnosticsProperty('life', life))
      ..add(DiagnosticsProperty('profileImageUrl', profileImageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileData &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userJob, userJob) || other.userJob == userJob) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            (identical(other.nextLevelPoint, nextLevelPoint) ||
                other.nextLevelPoint == nextLevelPoint) &&
            (identical(other.life, life) || other.life == life) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, userJob, uuid,
      userLevel, nextLevelPoint, life, profileImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileDataCopyWith<_$_ProfileData> get copyWith =>
      __$$_ProfileDataCopyWithImpl<_$_ProfileData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDataToJson(
      this,
    );
  }
}

abstract class _ProfileData implements ProfileData {
  const factory _ProfileData(
      {required final String userName,
      required final String userJob,
      required final String uuid,
      required final int userLevel,
      required final int nextLevelPoint,
      required final int life,
      final String? profileImageUrl}) = _$_ProfileData;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$_ProfileData.fromJson;

  @override
  String get userName;
  @override
  String get userJob;
  @override
  String get uuid;
  @override
  int get userLevel;
  @override
  int get nextLevelPoint;
  @override
  int get life;
  @override
  String? get profileImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileDataCopyWith<_$_ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}
