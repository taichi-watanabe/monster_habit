// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stamina_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StaminaItems {
  int get currentStamina => throw _privateConstructorUsedError;
  bool get isTimerPaused => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;
  DateTime? get pausedTime => throw _privateConstructorUsedError;
  Timer? get timer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StaminaItemsCopyWith<StaminaItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaminaItemsCopyWith<$Res> {
  factory $StaminaItemsCopyWith(
          StaminaItems value, $Res Function(StaminaItems) then) =
      _$StaminaItemsCopyWithImpl<$Res, StaminaItems>;
  @useResult
  $Res call(
      {int currentStamina,
      bool isTimerPaused,
      DateTime? time,
      DateTime? pausedTime,
      Timer? timer});
}

/// @nodoc
class _$StaminaItemsCopyWithImpl<$Res, $Val extends StaminaItems>
    implements $StaminaItemsCopyWith<$Res> {
  _$StaminaItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStamina = null,
    Object? isTimerPaused = null,
    Object? time = freezed,
    Object? pausedTime = freezed,
    Object? timer = freezed,
  }) {
    return _then(_value.copyWith(
      currentStamina: null == currentStamina
          ? _value.currentStamina
          : currentStamina // ignore: cast_nullable_to_non_nullable
              as int,
      isTimerPaused: null == isTimerPaused
          ? _value.isTimerPaused
          : isTimerPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedTime: freezed == pausedTime
          ? _value.pausedTime
          : pausedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaminaItemsImplCopyWith<$Res>
    implements $StaminaItemsCopyWith<$Res> {
  factory _$$StaminaItemsImplCopyWith(
          _$StaminaItemsImpl value, $Res Function(_$StaminaItemsImpl) then) =
      __$$StaminaItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStamina,
      bool isTimerPaused,
      DateTime? time,
      DateTime? pausedTime,
      Timer? timer});
}

/// @nodoc
class __$$StaminaItemsImplCopyWithImpl<$Res>
    extends _$StaminaItemsCopyWithImpl<$Res, _$StaminaItemsImpl>
    implements _$$StaminaItemsImplCopyWith<$Res> {
  __$$StaminaItemsImplCopyWithImpl(
      _$StaminaItemsImpl _value, $Res Function(_$StaminaItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStamina = null,
    Object? isTimerPaused = null,
    Object? time = freezed,
    Object? pausedTime = freezed,
    Object? timer = freezed,
  }) {
    return _then(_$StaminaItemsImpl(
      currentStamina: null == currentStamina
          ? _value.currentStamina
          : currentStamina // ignore: cast_nullable_to_non_nullable
              as int,
      isTimerPaused: null == isTimerPaused
          ? _value.isTimerPaused
          : isTimerPaused // ignore: cast_nullable_to_non_nullable
              as bool,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pausedTime: freezed == pausedTime
          ? _value.pausedTime
          : pausedTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
    ));
  }
}

/// @nodoc

class _$StaminaItemsImpl implements _StaminaItems {
  _$StaminaItemsImpl(
      {this.currentStamina = 3,
      this.isTimerPaused = false,
      this.time,
      this.pausedTime,
      this.timer});

  @override
  @JsonKey()
  final int currentStamina;
  @override
  @JsonKey()
  final bool isTimerPaused;
  @override
  final DateTime? time;
  @override
  final DateTime? pausedTime;
  @override
  final Timer? timer;

  @override
  String toString() {
    return 'StaminaItems(currentStamina: $currentStamina, isTimerPaused: $isTimerPaused, time: $time, pausedTime: $pausedTime, timer: $timer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaminaItemsImpl &&
            (identical(other.currentStamina, currentStamina) ||
                other.currentStamina == currentStamina) &&
            (identical(other.isTimerPaused, isTimerPaused) ||
                other.isTimerPaused == isTimerPaused) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.pausedTime, pausedTime) ||
                other.pausedTime == pausedTime) &&
            (identical(other.timer, timer) || other.timer == timer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentStamina, isTimerPaused, time, pausedTime, timer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaminaItemsImplCopyWith<_$StaminaItemsImpl> get copyWith =>
      __$$StaminaItemsImplCopyWithImpl<_$StaminaItemsImpl>(this, _$identity);
}

abstract class _StaminaItems implements StaminaItems {
  factory _StaminaItems(
      {final int currentStamina,
      final bool isTimerPaused,
      final DateTime? time,
      final DateTime? pausedTime,
      final Timer? timer}) = _$StaminaItemsImpl;

  @override
  int get currentStamina;
  @override
  bool get isTimerPaused;
  @override
  DateTime? get time;
  @override
  DateTime? get pausedTime;
  @override
  Timer? get timer;
  @override
  @JsonKey(ignore: true)
  _$$StaminaItemsImplCopyWith<_$StaminaItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
