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
  String? get uuid => throw _privateConstructorUsedError;
  String? get userImageUrl => throw _privateConstructorUsedError;
  List<ObjectivesData>? get objectives => throw _privateConstructorUsedError;
  UsersStatusData? get usersStatus => throw _privateConstructorUsedError;

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
      String? uuid,
      String? userImageUrl,
      List<ObjectivesData>? objectives,
      UsersStatusData? usersStatus});

  $UsersStatusDataCopyWith<$Res>? get usersStatus;
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
    Object? uuid = freezed,
    Object? userImageUrl = freezed,
    Object? objectives = freezed,
    Object? usersStatus = freezed,
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
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userImageUrl: freezed == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      objectives: freezed == objectives
          ? _value.objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as List<ObjectivesData>?,
      usersStatus: freezed == usersStatus
          ? _value.usersStatus
          : usersStatus // ignore: cast_nullable_to_non_nullable
              as UsersStatusData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersStatusDataCopyWith<$Res>? get usersStatus {
    if (_value.usersStatus == null) {
      return null;
    }

    return $UsersStatusDataCopyWith<$Res>(_value.usersStatus!, (value) {
      return _then(_value.copyWith(usersStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileDataImplCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$ProfileDataImplCopyWith(
          _$ProfileDataImpl value, $Res Function(_$ProfileDataImpl) then) =
      __$$ProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String userJob,
      String? uuid,
      String? userImageUrl,
      List<ObjectivesData>? objectives,
      UsersStatusData? usersStatus});

  @override
  $UsersStatusDataCopyWith<$Res>? get usersStatus;
}

/// @nodoc
class __$$ProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$ProfileDataImpl>
    implements _$$ProfileDataImplCopyWith<$Res> {
  __$$ProfileDataImplCopyWithImpl(
      _$ProfileDataImpl _value, $Res Function(_$ProfileDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? userJob = null,
    Object? uuid = freezed,
    Object? userImageUrl = freezed,
    Object? objectives = freezed,
    Object? usersStatus = freezed,
  }) {
    return _then(_$ProfileDataImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userJob: null == userJob
          ? _value.userJob
          : userJob // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      userImageUrl: freezed == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      objectives: freezed == objectives
          ? _value._objectives
          : objectives // ignore: cast_nullable_to_non_nullable
              as List<ObjectivesData>?,
      usersStatus: freezed == usersStatus
          ? _value.usersStatus
          : usersStatus // ignore: cast_nullable_to_non_nullable
              as UsersStatusData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDataImpl with DiagnosticableTreeMixin implements _ProfileData {
  const _$ProfileDataImpl(
      {required this.userName,
      required this.userJob,
      this.uuid,
      this.userImageUrl,
      final List<ObjectivesData>? objectives,
      this.usersStatus})
      : _objectives = objectives;

  factory _$ProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDataImplFromJson(json);

  @override
  final String userName;
  @override
  final String userJob;
  @override
  final String? uuid;
  @override
  final String? userImageUrl;
  final List<ObjectivesData>? _objectives;
  @override
  List<ObjectivesData>? get objectives {
    final value = _objectives;
    if (value == null) return null;
    if (_objectives is EqualUnmodifiableListView) return _objectives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UsersStatusData? usersStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileData(userName: $userName, userJob: $userJob, uuid: $uuid, userImageUrl: $userImageUrl, objectives: $objectives, usersStatus: $usersStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileData'))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('userJob', userJob))
      ..add(DiagnosticsProperty('uuid', uuid))
      ..add(DiagnosticsProperty('userImageUrl', userImageUrl))
      ..add(DiagnosticsProperty('objectives', objectives))
      ..add(DiagnosticsProperty('usersStatus', usersStatus));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userJob, userJob) || other.userJob == userJob) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.userImageUrl, userImageUrl) ||
                other.userImageUrl == userImageUrl) &&
            const DeepCollectionEquality()
                .equals(other._objectives, _objectives) &&
            (identical(other.usersStatus, usersStatus) ||
                other.usersStatus == usersStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userName,
      userJob,
      uuid,
      userImageUrl,
      const DeepCollectionEquality().hash(_objectives),
      usersStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      __$$ProfileDataImplCopyWithImpl<_$ProfileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileData implements ProfileData {
  const factory _ProfileData(
      {required final String userName,
      required final String userJob,
      final String? uuid,
      final String? userImageUrl,
      final List<ObjectivesData>? objectives,
      final UsersStatusData? usersStatus}) = _$ProfileDataImpl;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$ProfileDataImpl.fromJson;

  @override
  String get userName;
  @override
  String get userJob;
  @override
  String? get uuid;
  @override
  String? get userImageUrl;
  @override
  List<ObjectivesData>? get objectives;
  @override
  UsersStatusData? get usersStatus;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
