import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/users_status_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<StatusDataSource> statusDataSourceProvider =
    Provider<StatusDataSource>((ref) => StatusDataSource());

final supabase = Supabase.instance.client;

class StatusDataSource {
  StatusDataSource();

  //user_statusを取得
  Future<UsersStatusData> fetchUserStatus(String id) async {
    final data = await supabase
        .from('users')
        .select('usersStatus(uuid,nextLevel,level,totalPoint,totalMonster)')
        .eq('uuid', id)
        .single();
    final map = UsersStatusData.fromJson(data['usersStatus']);
    return map;
  }

  //totalPointをアップデート
  Future<void> updateTotalPoint(UsersStatusData data) async {
    return supabase
        .from('usersStatus')
        .update({'totalPoint': data.totalPoint}).eq('uuid', data.uuid!);
  }
}
