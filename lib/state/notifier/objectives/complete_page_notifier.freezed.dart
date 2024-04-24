// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_page_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompletePageItems {
  int get totalMonster => throw _privateConstructorUsedError;
  int get totalPoint => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompletePageItemsCopyWith<CompletePageItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletePageItemsCopyWith<$Res> {
  factory $CompletePageItemsCopyWith(
          CompletePageItems value, $Res Function(CompletePageItems) then) =
      _$CompletePageItemsCopyWithImpl<$Res, CompletePageItems>;
  @useResult
  $Res call({int totalMonster, int totalPoint, bool isLoading});
}

/// @nodoc
class _$CompletePageItemsCopyWithImpl<$Res, $Val extends CompletePageItems>
    implements $CompletePageItemsCopyWith<$Res> {
  _$CompletePageItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMonster = null,
    Object? totalPoint = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      totalMonster: null == totalMonster
          ? _value.totalMonster
          : totalMonster // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoint: null == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompletePageItemsImplCopyWith<$Res>
    implements $CompletePageItemsCopyWith<$Res> {
  factory _$$CompletePageItemsImplCopyWith(_$CompletePageItemsImpl value,
          $Res Function(_$CompletePageItemsImpl) then) =
      __$$CompletePageItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalMonster, int totalPoint, bool isLoading});
}

/// @nodoc
class __$$CompletePageItemsImplCopyWithImpl<$Res>
    extends _$CompletePageItemsCopyWithImpl<$Res, _$CompletePageItemsImpl>
    implements _$$CompletePageItemsImplCopyWith<$Res> {
  __$$CompletePageItemsImplCopyWithImpl(_$CompletePageItemsImpl _value,
      $Res Function(_$CompletePageItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMonster = null,
    Object? totalPoint = null,
    Object? isLoading = null,
  }) {
    return _then(_$CompletePageItemsImpl(
      totalMonster: null == totalMonster
          ? _value.totalMonster
          : totalMonster // ignore: cast_nullable_to_non_nullable
              as int,
      totalPoint: null == totalPoint
          ? _value.totalPoint
          : totalPoint // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CompletePageItemsImpl implements _CompletePageItems {
  _$CompletePageItemsImpl(
      {this.totalMonster = 0, this.totalPoint = 0, this.isLoading = false});

  @override
  @JsonKey()
  final int totalMonster;
  @override
  @JsonKey()
  final int totalPoint;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CompletePageItems(totalMonster: $totalMonster, totalPoint: $totalPoint, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletePageItemsImpl &&
            (identical(other.totalMonster, totalMonster) ||
                other.totalMonster == totalMonster) &&
            (identical(other.totalPoint, totalPoint) ||
                other.totalPoint == totalPoint) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalMonster, totalPoint, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletePageItemsImplCopyWith<_$CompletePageItemsImpl> get copyWith =>
      __$$CompletePageItemsImplCopyWithImpl<_$CompletePageItemsImpl>(
          this, _$identity);
}

abstract class _CompletePageItems implements CompletePageItems {
  factory _CompletePageItems(
      {final int totalMonster,
      final int totalPoint,
      final bool isLoading}) = _$CompletePageItemsImpl;

  @override
  int get totalMonster;
  @override
  int get totalPoint;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CompletePageItemsImplCopyWith<_$CompletePageItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
