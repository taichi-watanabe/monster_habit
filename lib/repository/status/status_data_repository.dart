import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monster_habit/data/service/status_data_source.dart';

import 'package:monster_habit/model/users_status_data.dart';
import 'package:monster_habit/repository/status/status_data_repository_impl.dart';

var statusDataRepositoryProvider = Provider<StatusDataRepository>(
  (ref) => StatusDataRepositoryImpl(
      statusRegisterDataSource: ref.watch(statusDataSourceProvider)),
);

abstract class StatusDataRepository {
  StatusDataRepository();
  Future<UsersStatusData> fetchUserStatus(String id);
  Future<void> updateTotalPoint(UsersStatusData data);
}
