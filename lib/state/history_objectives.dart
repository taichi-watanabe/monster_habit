import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_objectives.g.dart';

@riverpod
Future<List<ObjectivesData>> historyObjectivesList(
    HistoryObjectivesListRef ref) async {
  return await ref
      .watch(objectivesRepositoryProvider)
      .fetchHistoryObjectivesList();
}
