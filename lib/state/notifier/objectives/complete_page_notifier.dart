import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monster_habit/model/users_status_data.dart';
import 'package:monster_habit/repository/preferences/preferences_repository.dart';
import 'package:monster_habit/repository/status/status_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'complete_page_notifier.freezed.dart';
part 'complete_page_notifier.g.dart';

@riverpod
class CompletePageNotifier extends _$CompletePageNotifier {
  @override
  CompletePageItems build() {
    return CompletePageItems();
  }

  void setTotalMonster(value) {}

  void setTotalPoint(value) {
    state = state.copyWith(totalPoint: value);
  }

  void resetState() {
    state = state.copyWith(totalMonster: 0, totalPoint: 0);
  }

  Future<void> updateTotalPoint() async {
    _showLoading();
    var uuid = await ref.watch(preferencesRepositoryProvider).loadUuId();
    try {
      var statusData =
          UsersStatusData(uuid: uuid, totalPoint: state.totalPoint);
      await ref
          .watch(statusDataRepositoryProvider)
          .updateTotalPoint(statusData);
    } catch (e) {
      print('Error putObjectives' + e.toString());
      rethrow;
    } finally {
      resetState();
      _hideLoading();
    }
  }

  void _showLoading() => state = state.copyWith(isLoading: true);
  void _hideLoading() => state = state.copyWith(isLoading: false);
}

@freezed
class CompletePageItems with _$CompletePageItems {
  factory CompletePageItems({
    @Default(0) int totalMonster,
    @Default(0) int totalPoint,
    @Default(false) bool isLoading,
  }) = _CompletePageItems;
}
