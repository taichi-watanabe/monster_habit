import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'task_data.freezed.dart';
part 'task_data.g.dart';

@freezed
class TaskData with _$TaskData {
  const factory TaskData(
      {String? taskTitle,
      String? status,
      double? exPoint,
      int? objectiveId,
      int? id}) = _TaskData;

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);

  static List<TaskData> toList(List<dynamic>? json) {
    List<TaskData> _list = [];
    if (json == null) return _list;
    if (json.isEmpty) return _list;

    for (var taskList in json) {
      var taskDataList = taskList['task'] as List<dynamic>;
      for (var task in taskDataList) {
        var _taskMap = task as Map<String, dynamic>;
        var _task = TaskData.fromJson(_taskMap);
        _list.add(_task);
      }
    }
    return _list;
  }
}
