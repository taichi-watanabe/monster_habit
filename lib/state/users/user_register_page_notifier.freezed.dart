// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegistrationItems {
  String get userName => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get userImageUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegistrationItemsCopyWith<RegistrationItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationItemsCopyWith<$Res> {
  factory $RegistrationItemsCopyWith(
          RegistrationItems value, $Res Function(RegistrationItems) then) =
      _$RegistrationItemsCopyWithImpl<$Res, RegistrationItems>;
  @useResult
  $Res call({String userName, String uuid, String userImageUrl, String type});
}

/// @nodoc
class _$RegistrationItemsCopyWithImpl<$Res, $Val extends RegistrationItems>
    implements $RegistrationItemsCopyWith<$Res> {
  _$RegistrationItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? uuid = null,
    Object? userImageUrl = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      userImageUrl: null == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationItemsImplCopyWith<$Res>
    implements $RegistrationItemsCopyWith<$Res> {
  factory _$$RegistrationItemsImplCopyWith(_$RegistrationItemsImpl value,
          $Res Function(_$RegistrationItemsImpl) then) =
      __$$RegistrationItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String uuid, String userImageUrl, String type});
}

/// @nodoc
class __$$RegistrationItemsImplCopyWithImpl<$Res>
    extends _$RegistrationItemsCopyWithImpl<$Res, _$RegistrationItemsImpl>
    implements _$$RegistrationItemsImplCopyWith<$Res> {
  __$$RegistrationItemsImplCopyWithImpl(_$RegistrationItemsImpl _value,
      $Res Function(_$RegistrationItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? uuid = null,
    Object? userImageUrl = null,
    Object? type = null,
  }) {
    return _then(_$RegistrationItemsImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      userImageUrl: null == userImageUrl
          ? _value.userImageUrl
          : userImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegistrationItemsImpl implements _RegistrationItems {
  _$RegistrationItemsImpl(
      {this.userName = "",
      this.uuid = "",
      this.userImageUrl = "",
      this.type = ""});

  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String uuid;
  @override
  @JsonKey()
  final String userImageUrl;
  @override
  @JsonKey()
  final String type;

  @override
  String toString() {
    return 'RegistrationItems(userName: $userName, uuid: $uuid, userImageUrl: $userImageUrl, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationItemsImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.userImageUrl, userImageUrl) ||
                other.userImageUrl == userImageUrl) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userName, uuid, userImageUrl, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationItemsImplCopyWith<_$RegistrationItemsImpl> get copyWith =>
      __$$RegistrationItemsImplCopyWithImpl<_$RegistrationItemsImpl>(
          this, _$identity);
}

abstract class _RegistrationItems implements RegistrationItems {
  factory _RegistrationItems(
      {final String userName,
      final String uuid,
      final String userImageUrl,
      final String type}) = _$RegistrationItemsImpl;

  @override
  String get userName;
  @override
  String get uuid;
  @override
  String get userImageUrl;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$RegistrationItemsImplCopyWith<_$RegistrationItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
