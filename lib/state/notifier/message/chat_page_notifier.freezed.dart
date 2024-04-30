// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatPageItems {
  String get message => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Map<String, ProfileData> get profileCache =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatPageItemsCopyWith<ChatPageItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatPageItemsCopyWith<$Res> {
  factory $ChatPageItemsCopyWith(
          ChatPageItems value, $Res Function(ChatPageItems) then) =
      _$ChatPageItemsCopyWithImpl<$Res, ChatPageItems>;
  @useResult
  $Res call(
      {String message, bool isLoading, Map<String, ProfileData> profileCache});
}

/// @nodoc
class _$ChatPageItemsCopyWithImpl<$Res, $Val extends ChatPageItems>
    implements $ChatPageItemsCopyWith<$Res> {
  _$ChatPageItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
    Object? profileCache = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      profileCache: null == profileCache
          ? _value.profileCache
          : profileCache // ignore: cast_nullable_to_non_nullable
              as Map<String, ProfileData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatPageItemsImplCopyWith<$Res>
    implements $ChatPageItemsCopyWith<$Res> {
  factory _$$ChatPageItemsImplCopyWith(
          _$ChatPageItemsImpl value, $Res Function(_$ChatPageItemsImpl) then) =
      __$$ChatPageItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message, bool isLoading, Map<String, ProfileData> profileCache});
}

/// @nodoc
class __$$ChatPageItemsImplCopyWithImpl<$Res>
    extends _$ChatPageItemsCopyWithImpl<$Res, _$ChatPageItemsImpl>
    implements _$$ChatPageItemsImplCopyWith<$Res> {
  __$$ChatPageItemsImplCopyWithImpl(
      _$ChatPageItemsImpl _value, $Res Function(_$ChatPageItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
    Object? profileCache = null,
  }) {
    return _then(_$ChatPageItemsImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      profileCache: null == profileCache
          ? _value._profileCache
          : profileCache // ignore: cast_nullable_to_non_nullable
              as Map<String, ProfileData>,
    ));
  }
}

/// @nodoc

class _$ChatPageItemsImpl implements _ChatPageItems {
  _$ChatPageItemsImpl(
      {this.message = '',
      this.isLoading = false,
      final Map<String, ProfileData> profileCache = const {}})
      : _profileCache = profileCache;

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool isLoading;
  final Map<String, ProfileData> _profileCache;
  @override
  @JsonKey()
  Map<String, ProfileData> get profileCache {
    if (_profileCache is EqualUnmodifiableMapView) return _profileCache;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_profileCache);
  }

  @override
  String toString() {
    return 'ChatPageItems(message: $message, isLoading: $isLoading, profileCache: $profileCache)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageItemsImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._profileCache, _profileCache));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isLoading,
      const DeepCollectionEquality().hash(_profileCache));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageItemsImplCopyWith<_$ChatPageItemsImpl> get copyWith =>
      __$$ChatPageItemsImplCopyWithImpl<_$ChatPageItemsImpl>(this, _$identity);
}

abstract class _ChatPageItems implements ChatPageItems {
  factory _ChatPageItems(
      {final String message,
      final bool isLoading,
      final Map<String, ProfileData> profileCache}) = _$ChatPageItemsImpl;

  @override
  String get message;
  @override
  bool get isLoading;
  @override
  Map<String, ProfileData> get profileCache;
  @override
  @JsonKey(ignore: true)
  _$$ChatPageItemsImplCopyWith<_$ChatPageItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
