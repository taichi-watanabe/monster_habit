import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monster_habit/foundation/constant/strings.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';
import 'package:monster_habit/repository/preferences/preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectives_notifier.freezed.dart';
part 'objectives_notifier.g.dart';

@riverpod
class ObjectivesNotifier extends _$ObjectivesNotifier {
  @override
  ObjectivesItems build() {
    return ObjectivesItems();
  }

  void setObjectiveId(int value) {
    state = state.copyWith(objectiveId: value);
  }

  void setObjectivesTitle(String value) {
    state = state.copyWith(title: value);
    checkObjectiveAddPageButton();
  }

  void setObjectivesDeadline(String value) {
    state = state.copyWith(deadline: value);
    checkObjectiveAddPageButton();
  }

  void setObjectivesMemo(String value) {
    state = state.copyWith(memo: value);
  }

  void setArchivementPoint(double value) {
    state = state.copyWith(archivementPoint: state.archivementPoint + value);
  }

  void setTotalPoint(double value) {
    state = state.copyWith(totalPoint: value);
  }

  void setTaskCount(int value) {
    state = state.copyWith(taskCount: value);
  }

  void setObjectivesUrl(String value) {
    state = state.copyWith(url: value);
  }

  void setbeginAt(String value) {
    state = state.copyWith(beginAt: value);
  }

  String? titleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Strings.objectiveTitleEmpty;
    } else {
      return null;
    }
  }

  String? dateValidator(String? value) {
    RegExp regExp = RegExp(Strings.datePattern);
    if (value == null || value.isEmpty) {
      return Strings.objectiveDateEmpty;
    } else if (!regExp.hasMatch(value)) {
      return Strings.dateMatch;
    } else {
      return null;
    }
  }

  void setObjectiveData(ObjectivesData objective) {
    var _archivementPoint = objective.archivementPoint.toDouble();
    var _title = objective.mokuhyoTitle ?? '';
    var _memo = objective.mokuhyoMemo ?? '';
    var _url = objective.monsterUrl ?? '';
    var _objectiveId = objective.id;
    var _taskCount = objective.taskCount ?? 0;
    var _beginAt = objective.beginAt ?? '';
    var _deadline = objective.deadline ?? '';
    setArchivementPoint(_archivementPoint);
    setObjectivesDeadline(_deadline);
    setObjectivesTitle(_title);
    setObjectivesMemo(_memo);
    setObjectivesUrl(_url);
    setObjectiveId(_objectiveId!);
    setTaskCount(_taskCount);
    setbeginAt(_beginAt);
  }

  void resetState() {
    state = state.copyWith(
        archivementPoint: 0,
        title: '',
        memo: '',
        url: '',
        totalPoint: 0,
        isLoading: false,
        objectiveId: 0,
        taskCount: 0,
        checkObjectivePageButton: false,
        deadline: '',
        isTaskList: false);
  }

  void isTaskList(List<TaskData> task) {
    if (task.isEmpty) {
      state = state.copyWith(isTaskList: false);
      checkObjectiveAddPageButton();
    } else {
      state = state.copyWith(isTaskList: true);
      checkObjectiveAddPageButton();
    }
  }

  void checkObjectiveAddPageButton() {
    if (state.title.isNotEmpty &&
        state.isTaskList &&
        state.deadline.isNotEmpty &&
        dateValidator(state.deadline) == null) {
      state = state.copyWith(checkObjectivePageButton: true);
    } else {
      state = state.copyWith(checkObjectivePageButton: false);
    }
  }

  Future<int?> getObjectiveId() async {
    _showLoading();
    var uuid = await ref.watch(preferencesRepositoryProvider).loadUuId();
    try {
      var id =
          await ref.watch(objectivesRepositoryProvider).getObjectiveId(uuid!);
      return id;
    } catch (e) {
      print('Error getObjectiveId' + e.toString());
      rethrow;
    } finally {
      _hideLoading();
    }
  }

  //目標を追加（動作的には作られたテーブルをアップデートする）
  Future<void> putObjectives(int id, bool edit) async {
    _showLoading();
    setObjectiveId(id);
    var uuid = await ref.watch(preferencesRepositoryProvider).loadUuId();
    try {
      var objectiveData = ObjectivesData(
          id: state.objectiveId,
          uuid: uuid,
          totalPoint: state.totalPoint.toInt(),
          archivementPoint: state.archivementPoint.toInt(),
          mokuhyoTitle: state.title,
          taskCount: state.taskCount,
          mokuhyoMemo: state.memo,
          monsterUrl: state.url,
          beginAt: !edit ? DateTime.now().toString() : state.beginAt,
          deadline: state.deadline);
      await ref
          .watch(objectivesRepositoryProvider)
          .putObjectives(objectiveData);
    } catch (e) {
      print('Error putObjectives' + e.toString());
      rethrow;
    } finally {
      resetState();
      _hideLoading();
    }
  }

  Future<void> deleteObjective() async {
    _showLoading();
    var uuid = await ref.watch(preferencesRepositoryProvider).loadUuId();
    try {
      var objectiveData = ObjectivesData(
        id: state.objectiveId,
        uuid: uuid,
      );
      await ref
          .watch(objectivesRepositoryProvider)
          .deleteObjective(objectiveData);
    } catch (e) {
      print('Error deleteObjective' + e.toString());
      rethrow;
    } finally {
      resetState();
      _hideLoading();
    }
  }

  Future<void> completeObjective() async {
    _showLoading();
    var uuid = await ref.watch(preferencesRepositoryProvider).loadUuId();
    try {
      var objectiveData = ObjectivesData(
          archivementPoint: state.archivementPoint.toInt(),
          totalPoint: state.totalPoint.toInt(),
          id: state.objectiveId,
          mokuhyoTitle: state.title,
          taskCount: state.taskCount,
          mokuhyoMemo: state.memo,
          deadline: state.deadline,
          uuid: uuid,
          endAt: DateTime.now().toString());
      await ref
          .watch(objectivesRepositoryProvider)
          .completeObjective(objectiveData);
    } catch (e) {
      print('Error completeObjective' + e.toString());
      rethrow;
    } finally {
      resetState();
      _hideLoading();
    }
  }

  Future<void> failedObjective() async {
    _showLoading();
    var uuid = await ref.watch(preferencesRepositoryProvider).loadUuId();
    try {
      var objectiveData = ObjectivesData(
          archivementPoint: state.archivementPoint.toInt(),
          id: state.objectiveId,
          uuid: uuid,
          endAt: DateTime.now().toString());
      await ref
          .watch(objectivesRepositoryProvider)
          .failedObjective(objectiveData);
    } catch (e) {
      print('Error completeObjective' + e.toString());
      rethrow;
    } finally {
      resetState();
      _hideLoading();
    }
  }

  //時間切れ用のfailed作成する
  Future<void> deadlinedObjective(ObjectivesData data) async {
    try {
      await ref.watch(objectivesRepositoryProvider).failedObjective(data);
    } catch (e) {
      print('Error deadlinedObjective' + e.toString());
      rethrow;
    }
  }

  void _showLoading() => state = state.copyWith(isLoading: true);
  void _hideLoading() => state = state.copyWith(isLoading: false);
}

@freezed
class ObjectivesItems with _$ObjectivesItems {
  factory ObjectivesItems({
    @Default("") String title,
    @Default("") String memo,
    @Default("") String url,
    @Default(0.0) double totalPoint,
    @Default(0.0) double archivementPoint,
    @Default(false) bool isLoading,
    @Default(false) bool checkObjectivePageButton,
    @Default(false) bool isTaskList,
    @Default(0) int taskCount,
    @Default('') String beginAt,
    @Default('') String deadline,
    int? objectiveId,
  }) = _ObjectivesItems;
}
