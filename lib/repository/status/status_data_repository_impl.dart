import 'package:monster_habit/data/service/status_data_source.dart';
import 'package:monster_habit/model/users_status_data.dart';
import 'package:monster_habit/repository/status/status_data_repository.dart';

class StatusDataRepositoryImpl implements StatusDataRepository {
  StatusDataRepositoryImpl({required StatusDataSource statusRegisterDataSource})
      : _statusRegisterDataSource = statusRegisterDataSource;

  final StatusDataSource _statusRegisterDataSource;

  @override
  Future<UsersStatusData> fetchUserStatus(String id) async {
    return await _statusRegisterDataSource.fetchUserStatus(id);
  }

  @override
  Future<void> updateTotalPoint(UsersStatusData data) async {
    return await _statusRegisterDataSource.updateTotalPoint(data);
  }
}
