import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monster_habit/data/service/user_data_source.dart';
import 'package:monster_habit/model/profile_data.dart';

import 'package:monster_habit/repository/users/user_data_repository_impl.dart';

var userDataRepositoryProvider = Provider<UserDataRepository>(
  (ref) => UserDataRepositoryImpl(
      userRegisterDataSource: ref.watch(userDataSourceProvider)),
);

abstract class UserDataRepository {
  UserDataRepository();

  Future<ProfileData?> postProfileData(ProfileData profile);
  Future<ProfileData?> fetchUser(String id);
  Future<ProfileData> fetchHomePageData(String id, WidgetRef ref);
  Future<bool> checkUser(String id);
}
