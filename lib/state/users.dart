import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:monster_habit/model/users_status_data.dart';
import 'package:monster_habit/repository/status/status_data_repository.dart';
import 'package:monster_habit/repository/users/user_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users.g.dart';

//ホームページ用のuserDataをfetch
@riverpod
Future<ProfileData> fetchHomePageData(
    FetchHomePageDataRef ref, String id, WidgetRef refP) async {
  return await ref
      .watch(userDataRepositoryProvider)
      .fetchHomePageData(id, refP);
}

//アカウントページ用のユーザ情報を取得
@riverpod
Future<ProfileData?> fetchUser(FetchUserRef ref, String id) async {
  return await ref.watch(userDataRepositoryProvider).fetchUser(id);
}

@riverpod
Future<UsersStatusData> fetchUserStatus(
    FetchUserStatusRef ref, String id) async {
  return await ref.watch(statusDataRepositoryProvider).fetchUserStatus(id);
}
