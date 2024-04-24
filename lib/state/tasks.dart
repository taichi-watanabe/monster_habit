import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tasks.g.dart';

@riverpod
Future<List<TaskData>?> taskList(TaskListRef ref, int id) async {
  return await ref.watch(objectivesRepositoryProvider).fetchTaskList(id);
}
