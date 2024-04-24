import 'package:monster_habit/repository/preferences/preferences_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'access_token.g.dart';

@riverpod
Future<String?> accessToken(AccessTokenRef ref) async {
  return await ref.watch(preferencesRepositoryProvider).loadUuId();
}
