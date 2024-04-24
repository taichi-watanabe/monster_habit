// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskItems {
  double get exPoint => throw _privateConstructorUsedError;
  String get taskTitle => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasPoint => throw _privateConstructorUsedError;
  bool get checkTaskAddPageButton => throw _privateConstructorUsedError;
  int? get objectiveId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskItemsCopyWith<TaskItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskItemsCopyWith<$Res> {
  factory $TaskItemsCopyWith(TaskItems value, $Res Function(TaskItems) then) =
      _$TaskItemsCopyWithImpl<$Res, TaskItems>;
  @useResult
  $Res call(
      {double exPoint,
      String taskTitle,
      bool isLoading,
      bool hasPoint,
      bool checkTaskAddPageButton,
      int? objectiveId});
}

/// @nodoc
class _$TaskItemsCopyWithImpl<$Res, $Val extends TaskItems>
    implements $TaskItemsCopyWith<$Res> {
  _$TaskItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exPoint = null,
    Object? taskTitle = null,
    Object? isLoading = null,
    Object? hasPoint = null,
    Object? checkTaskAddPageButton = null,
    Object? objectiveId = freezed,
  }) {
    return _then(_value.copyWith(
      exPoint: null == exPoint
          ? _value.exPoint
          : exPoint // ignore: cast_nullable_to_non_nullable
              as double,
      taskTitle: null == taskTitle
          ? _value.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPoint: null == hasPoint
          ? _value.hasPoint
          : hasPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      checkTaskAddPageButton: null == checkTaskAddPageButton
          ? _value.checkTaskAddPageButton
          : checkTaskAddPageButton // ignore: cast_nullable_to_non_nullable
              as bool,
      objectiveId: freezed == objectiveId
          ? _value.objectiveId
          : objectiveId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskItemsImplCopyWith<$Res>
    implements $TaskItemsCopyWith<$Res> {
  factory _$$TaskItemsImplCopyWith(
          _$TaskItemsImpl value, $Res Function(_$TaskItemsImpl) then) =
      __$$TaskItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double exPoint,
      String taskTitle,
      bool isLoading,
      bool hasPoint,
      bool checkTaskAddPageButton,
      int? objectiveId});
}

/// @nodoc
class __$$TaskItemsImplCopyWithImpl<$Res>
    extends _$TaskItemsCopyWithImpl<$Res, _$TaskItemsImpl>
    implements _$$TaskItemsImplCopyWith<$Res> {
  __$$TaskItemsImplCopyWithImpl(
      _$TaskItemsImpl _value, $Res Function(_$TaskItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exPoint = null,
    Object? taskTitle = null,
    Object? isLoading = null,
    Object? hasPoint = null,
    Object? checkTaskAddPageButton = null,
    Object? objectiveId = freezed,
  }) {
    return _then(_$TaskItemsImpl(
      exPoint: null == exPoint
          ? _value.exPoint
          : exPoint // ignore: cast_nullable_to_non_nullable
              as double,
      taskTitle: null == taskTitle
          ? _value.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPoint: null == hasPoint
          ? _value.hasPoint
          : hasPoint // ignore: cast_nullable_to_non_nullable
              as bool,
      checkTaskAddPageButton: null == checkTaskAddPageButton
          ? _value.checkTaskAddPageButton
          : checkTaskAddPageButton // ignore: cast_nullable_to_non_nullable
              as bool,
      objectiveId: freezed == objectiveId
          ? _value.objectiveId
          : objectiveId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TaskItemsImpl implements _TaskItems {
  _$TaskItemsImpl(
      {this.exPoint = 0.0,
      this.taskTitle = '',
      this.isLoading = false,
      this.hasPoint = false,
      this.checkTaskAddPageButton = false,
      this.objectiveId});

  @override
  @JsonKey()
  final double exPoint;
  @override
  @JsonKey()
  final String taskTitle;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasPoint;
  @override
  @JsonKey()
  final bool checkTaskAddPageButton;
  @override
  final int? objectiveId;

  @override
  String toString() {
    return 'TaskItems(exPoint: $exPoint, taskTitle: $taskTitle, isLoading: $isLoading, hasPoint: $hasPoint, checkTaskAddPageButton: $checkTaskAddPageButton, objectiveId: $objectiveId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskItemsImpl &&
            (identical(other.exPoint, exPoint) || other.exPoint == exPoint) &&
            (identical(other.taskTitle, taskTitle) ||
                other.taskTitle == taskTitle) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasPoint, hasPoint) ||
                other.hasPoint == hasPoint) &&
            (identical(other.checkTaskAddPageButton, checkTaskAddPageButton) ||
                other.checkTaskAddPageButton == checkTaskAddPageButton) &&
            (identical(other.objectiveId, objectiveId) ||
                other.objectiveId == objectiveId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exPoint, taskTitle, isLoading,
      hasPoint, checkTaskAddPageButton, objectiveId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskItemsImplCopyWith<_$TaskItemsImpl> get copyWith =>
      __$$TaskItemsImplCopyWithImpl<_$TaskItemsImpl>(this, _$identity);
}

abstract class _TaskItems implements TaskItems {
  factory _TaskItems(
      {final double exPoint,
      final String taskTitle,
      final bool isLoading,
      final bool hasPoint,
      final bool checkTaskAddPageButton,
      final int? objectiveId}) = _$TaskItemsImpl;

  @override
  double get exPoint;
  @override
  String get taskTitle;
  @override
  bool get isLoading;
  @override
  bool get hasPoint;
  @override
  bool get checkTaskAddPageButton;
  @override
  int? get objectiveId;
  @override
  @JsonKey(ignore: true)
  _$$TaskItemsImplCopyWith<_$TaskItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
