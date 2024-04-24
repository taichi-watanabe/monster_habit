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
  String get content => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

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
  $Res call({String content, bool isLoading});
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
    Object? content = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({String content, bool isLoading});
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
    Object? content = null,
    Object? isLoading = null,
  }) {
    return _then(_$ChatPageItemsImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatPageItemsImpl implements _ChatPageItems {
  _$ChatPageItemsImpl({this.content = '', this.isLoading = false});

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ChatPageItems(content: $content, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatPageItemsImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatPageItemsImplCopyWith<_$ChatPageItemsImpl> get copyWith =>
      __$$ChatPageItemsImplCopyWithImpl<_$ChatPageItemsImpl>(this, _$identity);
}

abstract class _ChatPageItems implements ChatPageItems {
  factory _ChatPageItems({final String content, final bool isLoading}) =
      _$ChatPageItemsImpl;

  @override
  String get content;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ChatPageItemsImplCopyWith<_$ChatPageItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
