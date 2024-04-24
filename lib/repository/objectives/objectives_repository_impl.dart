import 'package:monster_habit/data/service/objectives_data_source.dart';
import 'package:monster_habit/model/capture_data.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';

class ObjectivesRepositoryImpl implements ObjectivesRepository {
  ObjectivesRepositoryImpl({required ObjectivesDataSource objectivesDataSource})
      : _objectivesDataSource = objectivesDataSource;

  final ObjectivesDataSource _objectivesDataSource;

  @override
  Future<ObjectivesData?> putObjectives(ObjectivesData data) async {
    return await _objectivesDataSource.putObjectives(data);
  }

  @override
  Future<ObjectivesData?> getObjective(String uuid, int id) async {
    return await _objectivesDataSource.getObjective(uuid, id);
  }

  @override
  Future<int?> getObjectiveId(String uuid) async {
    return await _objectivesDataSource.getObjectiveId(uuid);
  }

  @override
  Future<List<ObjectivesData>> fetchObjectivesList(String id) async {
    return await _objectivesDataSource.fetchObjectivesList(id);
  }

  @override
  Future<String> getMonsterUrl() async {
    return await _objectivesDataSource.getMonsterUrl();
  }

  @override
  Future<List<TaskData>?> fetchTaskList(int id) async {
    return await _objectivesDataSource.fetchTaskList(id);
  }

  @override
  Future<TaskData?> putTask(TaskData task) async {
    return await _objectivesDataSource.putTask(task);
  }

  @override
  Future<void> editTask(TaskData task) async {
    return await _objectivesDataSource.editTask(task);
  }

  @override
  Future<void> completeTask(int id) async {
    return await _objectivesDataSource.completeTask(id);
  }

  @override
  Future<void> deleteTask(int id) async {
    return await _objectivesDataSource.deleteTask(id);
  }

  @override
  Future<List<ObjectivesData>> fetchHistoryObjectivesList() async {
    return await _objectivesDataSource.fetchHistoryObjectivesList();
  }

  @override
  Future<List<CaptureData>> fetchCaptureBooksList() async {
    return await _objectivesDataSource.fetchCaptureBooksList();
  }

  @override
  Future saveObjectives(ObjectivesData objectives) async {
    return await _objectivesDataSource.saveObjectives(objectives);
  }

  @override
  Future deleteObjective(ObjectivesData data) async {
    return await _objectivesDataSource.deleteObjective(data);
  }

  @override
  Future completeObjective(ObjectivesData data) async {
    return await _objectivesDataSource.completeObjective(data);
  }

  @override
  Future failedObjective(ObjectivesData data) async {
    return await _objectivesDataSource.failedObjective(data);
  }

  @override
  Future saveObjectiveTasks(TaskData tasks) async {
    return await _objectivesDataSource.saveObjectiveTasks(tasks);
  }
}
