import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/data/persistence/preferences_services.dart';

final Provider<PreferencesRepository> preferencesRepositoryProvider =
    Provider<PreferencesRepository>((ref) => PreferencesRepository(
        preferencesService: ref.watch(preferencesServiceProvider)));

class PreferencesRepository {
  PreferencesRepository({required PreferencesService preferencesService})
      : _preferencesService = preferencesService;

  final PreferencesService _preferencesService;

  Future<String?> loadUuId() async => await _preferencesService.loadUuId();
  Future<bool?> saveUuId(String uid) async =>
      await _preferencesService.saveUuId(uid);
  Future<String?> loadTime() async => await _preferencesService.loadTime();
  Future<bool?> saveTime(String time) async =>
      await _preferencesService.saveTime(time);
  Future<bool?> clearTime() async => await _preferencesService.clearTime();
}
