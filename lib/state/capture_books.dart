import 'package:monster_habit/model/capture_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'capture_books.g.dart';

@riverpod
Future<List<CaptureData>> CaptureBooksList(CaptureBooksListRef ref) async {
  return await ref.watch(objectivesRepositoryProvider).fetchCaptureBooksList();
}
