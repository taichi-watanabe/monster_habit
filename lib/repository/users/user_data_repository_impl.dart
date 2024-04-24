import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/data/service/user_data_source.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:monster_habit/repository/users/user_data_repository.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  UserDataRepositoryImpl({required UserDataSource userRegisterDataSource})
      : _userRegisterDataSource = userRegisterDataSource;

  final UserDataSource _userRegisterDataSource;

  @override
  Future<ProfileData?> postProfileData(ProfileData profile) async {
    return await _userRegisterDataSource.postProfileData(profile);
  }

  @override
  Future<ProfileData?> fetchUser(String id) async {
    return await _userRegisterDataSource.fetchUser(id);
  }

  @override
  Future<ProfileData> fetchHomePageData(String id, WidgetRef ref) async {
    return await _userRegisterDataSource.fetchHomePageData(id, ref);
  }

  @override
  Future<bool> checkUser(String id) async {
    return await _userRegisterDataSource.checkUser(id);
  }
}
