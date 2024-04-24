import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:monster_habit/repository/objectives/objectives_repository.dart';
import 'package:monster_habit/repository/status/status_data_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<UserDataSource> userDataSourceProvider =
    Provider<UserDataSource>((ref) => UserDataSource());

final supabase = Supabase.instance.client;

class UserDataSource {
  UserDataSource();

  //ユーザー情報を保存
  Future<ProfileData?> postProfileData(ProfileData profile) async {
    return await supabase.from('users').insert({
      'uuid': profile.uuid,
      'userName': profile.userName,
      'userJob': profile.userJob,
      'userImageUrl': profile.userImageUrl
    }).whenComplete(
        () => supabase.from('users_status').insert({'uuid': profile.uuid}));
  }

  //ホーム用のユーザー情報を取得
  Future<ProfileData> fetchHomePageData(String id, WidgetRef ref) async {
    final userData =
        await supabase.from('users').select().eq('uuid', id).single();
    final statusData =
        await ref.watch(statusDataRepositoryProvider).fetchUserStatus(id);
    final objectiveData =
        await ref.watch(objectivesRepositoryProvider).fetchObjectivesList(id);
    final List<Map<String, dynamic>> objectivesDataList =
        objectiveData.map((obj) => obj.toJson()).toList();
    final map = {
      'userName': userData['userName'],
      'userJob': userData['userJob'],
      'userImageUrl': userData['userImageUrl'],
      'usersStatus': statusData.toJson(),
      'objectives': objectivesDataList,
    };
    return ProfileData.fromJson(map);
  }

  //user情報を取得
  Future<ProfileData?> fetchUser(String id) async {
    final response =
        await supabase.from('users').select().eq('uuid', id).maybeSingle();
    if (response == null) {
      return null;
    } else {
      return ProfileData.fromJson(response);
    }
  }

  Future<bool> checkUser(String id) async {
    // fetchUser 関数を使ってユーザーデータを取得
    final userData = await fetchUser(id);

    // userData が空でない場合は true を、空の場合は false を返す
    return userData != null;
  }
}
