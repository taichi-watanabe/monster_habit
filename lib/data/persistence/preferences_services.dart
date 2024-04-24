import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Provider<PreferencesService> preferencesServiceProvider =
    Provider<PreferencesService>((_) => PreferencesService());

class PreferencesService {
  // ignore: constant_identifier_names
  static const String KEY_USER_ID = 'uuid';
  static const String KEY_TIME = 'time';

  Future<String?> loadUuId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_USER_ID);
  }

  Future saveUuId(String id) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(KEY_USER_ID, id);
  }

  Future<bool> clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }

  Future saveTime(String time) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(KEY_TIME, time);
  }

  Future<String?> loadTime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(KEY_TIME);
  }

  Future clearTime() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(KEY_TIME, '');
  }
}
