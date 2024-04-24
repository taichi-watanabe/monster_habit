import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'objectives.g.dart';

//目標リストをfetch
@riverpod
Future<List<ObjectivesData>> objectivesList(
    ObjectivesListRef ref, String id) async {
  return await ref.watch(objectivesRepositoryProvider).fetchObjectivesList(id);
}

//目標テーブルからidが一致するレコードを取得する
@riverpod
Future<ObjectivesData?> objective(ObjectiveRef ref, String uuid, int id) async {
  return await ref.watch(objectivesRepositoryProvider).getObjective(uuid, id);
}

//目標テーブルを作成し、objectiveIdを取得する
@riverpod
Future<int?> objectiveId(ObjectiveIdRef ref, String uuid) async {
  return await ref.watch(objectivesRepositoryProvider).getObjectiveId(uuid);
}

//モンスターURLを取得する
@riverpod
Future<String> getMonsterUrl(GetMonsterUrlRef ref) async {
  return await ref.watch(objectivesRepositoryProvider).getMonsterUrl();
}
