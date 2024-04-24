import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monster_habit/data/service/objectives_data_source.dart';
import 'package:monster_habit/model/capture_data.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository_impl.dart';

var objectivesRepositoryProvider = Provider<ObjectivesRepository>(
  (ref) => ObjectivesRepositoryImpl(
      objectivesDataSource: ref.watch(objectivesDataSourceProvider)),
);

abstract class ObjectivesRepository {
  ObjectivesRepository();

  Future<List<ObjectivesData>> fetchObjectivesList(String id);
  Future<List<TaskData>?> fetchTaskList(int id);
  Future<TaskData?> putTask(TaskData task);
  Future<void> editTask(TaskData task);
  Future<void> deleteTask(int id);
  Future<void> completeTask(int id);
  Future<List<ObjectivesData>> fetchHistoryObjectivesList();
  Future<List<CaptureData>> fetchCaptureBooksList();
  Future<ObjectivesData?> putObjectives(ObjectivesData objectives);
  Future<ObjectivesData?> getObjective(String uuid, int id);
  Future<int?> getObjectiveId(String uuid);
  Future<String> getMonsterUrl();
  Future saveObjectives(ObjectivesData objectives);
  Future<void> deleteObjective(ObjectivesData data);
  Future<void> completeObjective(ObjectivesData data);
  Future<void> failedObjective(ObjectivesData data);
  Future saveObjectiveTasks(TaskData tasks);
}
