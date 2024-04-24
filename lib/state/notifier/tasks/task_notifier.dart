import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monster_habit/foundation/constant/strings.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_notifier.freezed.dart';
part 'task_notifier.g.dart';

@riverpod
class TaskNotifier extends _$TaskNotifier {
  @override
  TaskItems build() {
    return TaskItems();
  }

  void setTaskTitle(String value) {
    state = state.copyWith(taskTitle: value);
    checkTaskAddPageButton();
  }

  void setExPoint(double value) {
    state = state.copyWith(exPoint: value);
    hasPoint(value);
  }

  void setObjectiveId(int value) {
    state = state.copyWith(objectiveId: value);
  }

  void setTaskData(TaskData task) {
    var _taskTitle = task.taskTitle;
    var _exPoint = task.exPoint;
    setExPoint(_exPoint!);
    setTaskTitle(_taskTitle!);
  }

  void resetState() {
    state = state.copyWith(
        exPoint: 0, taskTitle: '', checkTaskAddPageButton: false);
  }

  void hasPoint(double value) {
    if (value == 0) {
      state = state.copyWith(hasPoint: false);
      checkTaskAddPageButton();
    } else {
      state = state.copyWith(hasPoint: true);
      checkTaskAddPageButton();
    }
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.taskTitleEmpty;
    } else {
      return null;
    }
  }

  void checkTaskAddPageButton() {
    if (state.taskTitle.isNotEmpty && state.hasPoint) {
      state = state.copyWith(checkTaskAddPageButton: true);
    } else {
      state = state.copyWith(checkTaskAddPageButton: false);
    }
  }

  //taskを追加
  Future<void> putTask(int id) async {
    _showLoading();
    try {
      setObjectiveId(id);
      var taskData = TaskData(
          objectiveId: state.objectiveId,
          taskTitle: state.taskTitle,
          exPoint: state.exPoint);
      await ref.watch(objectivesRepositoryProvider).putTask(taskData);
    } catch (e) {
      print('Error putTask' + e.toString());
      rethrow;
    } finally {
      resetState();
      _hideLoading();
    }
  }

  //taskを編集
  Future<void> editTask(int id) async {
    _showLoading();
    try {
      var taskData =
          TaskData(id: id, taskTitle: state.taskTitle, exPoint: state.exPoint);
      await ref.watch(objectivesRepositoryProvider).editTask(taskData);
    } catch (e) {
      print('Error editTask' + e.toString());
      rethrow;
    } finally {
      resetState();
      _hideLoading();
    }
  }

  //taskを削除
  Future<void> deleteTask(int id) async {
    _showLoading();
    try {
      await ref.watch(objectivesRepositoryProvider).deleteTask(id);
    } catch (e) {
      print('Error deleteTask' + e.toString());
      rethrow;
    } finally {
      _hideLoading();
    }
  }

  //taskを完了
  Future<void> completeTask(TaskData data) async {
    _showLoading();
    try {
      ref
          .watch(objectivesNotifierProvider.notifier)
          .setArchivementPoint(data.exPoint!);
      await ref.watch(objectivesRepositoryProvider).completeTask(data.id!);
    } catch (e) {
      print('Error completeTask' + e.toString());
      rethrow;
    } finally {
      _hideLoading();
    }
  }

  void _showLoading() => state = state.copyWith(isLoading: true);
  void _hideLoading() => state = state.copyWith(isLoading: false);
}

@freezed
class TaskItems with _$TaskItems {
  factory TaskItems({
    @Default(0.0) double exPoint,
    @Default('') String taskTitle,
    @Default(false) bool isLoading,
    @Default(false) bool hasPoint,
    @Default(false) bool checkTaskAddPageButton,
    int? objectiveId,
  }) = _TaskItems;
}
