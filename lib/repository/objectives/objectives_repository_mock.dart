import 'package:monster_habit/model/capture_data.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';

class ObjectivesRepositoryMock implements ObjectivesRepository {
  ObjectivesRepositoryMock();

  @override
  Future<ObjectivesData?> putObjectives(ObjectivesData data) async {
    throw UnimplementedError();
  }

  @override
  Future<ObjectivesData?> getObjective(String uuid, int id) async {
    throw UnimplementedError();
  }

  @override
  Future<int?> getObjectiveId(String uuid) async {
    throw UnimplementedError();
  }

  @override
  Future<List<ObjectivesData>> fetchObjectivesList(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<String> getMonsterUrl() async {
    throw UnimplementedError();
  }

  @override
  Future<List<TaskData>?> fetchTaskList(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<TaskData?> putTask(TaskData task) async {
    throw UnimplementedError();
  }

  @override
  Future<void> editTask(TaskData task) async {
    throw UnimplementedError();
  }

  @override
  Future<void> completeTask(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<ObjectivesData>> fetchHistoryObjectivesList() async {
    throw UnimplementedError();
  }

  @override
  Future<List<CaptureData>> fetchCaptureBooksList() async {
    throw UnimplementedError();
  }

  @override
  Future saveObjectives(ObjectivesData objectives) async {
    throw UnimplementedError();
  }

  @override
  Future deleteObjective(ObjectivesData data) async {
    throw UnimplementedError();
  }

  @override
  Future completeObjective(ObjectivesData data) async {
    throw UnimplementedError();
  }

  @override
  Future failedObjective(ObjectivesData data) async {
    throw UnimplementedError();
  }

  @override
  Future saveObjectiveTasks(TaskData tasks) async {
    throw UnimplementedError();
  }
}
