import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:monster_habit/repository/preferences/preferences_repository.dart';
import 'package:monster_habit/repository/users/user_data_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
part 'user_register_page_notifier.freezed.dart';
part 'user_register_page_notifier.g.dart';

@riverpod
class UserRegisterNotifier extends _$UserRegisterNotifier {
  @override
  RegistrationItems build() {
    return RegistrationItems();
  }

  void setUserName(String value) {
    state = state.copyWith(userName: value);
  }

  void setUserImageUrl(String value) {
    state = state.copyWith(userImageUrl: value);
  }

  void setType(String value) {
    state = state.copyWith(type: value);
  }

  Future<void> setUuid() async {
    var uuid = const Uuid();
    var newId = uuid.v4();
    state = state.copyWith(uuid: newId);
  }

  void saveUser() async {
    try {
      await setUuid();
      var profile = ProfileData(
          userName: state.userName,
          userJob: state.type,
          uuid: state.uuid,
          userImageUrl: state.userImageUrl);

      await ref.watch(userDataRepositoryProvider).postProfileData(profile);
      await ref.watch(preferencesRepositoryProvider).saveUuId(state.uuid);
    } catch (e) {
      print('エラー（user登録）' + e.toString());
      rethrow;
    }
  }

  Future<bool> checkUser(String id) async {
    try {
      final checkBool =
          await ref.watch(userDataRepositoryProvider).checkUser(id);
      return checkBool;
    } catch (e) {
      print('エラー（uuidfetch）' + e.toString());
      rethrow;
    }
  }

  //usersテーブルからuserリストを取得（List<Map<String, dynamic>>型）
  Future<ProfileData?> fetchUser(String id) async {
    try {
      final data = await ref.watch(userDataRepositoryProvider).fetchUser(id);
      return data;
    } catch (e) {
      print('エラー（uuidfetch）' + e.toString());
      rethrow;
    }
  }
}

@freezed
class RegistrationItems with _$RegistrationItems {
  factory RegistrationItems(
      {@Default("") String userName,
      @Default("") String uuid,
      @Default("") String userImageUrl,
      @Default("") String type}) = _RegistrationItems;
}
