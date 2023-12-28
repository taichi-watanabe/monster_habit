import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:monster_habit/model/mokuhyo_data.dart';

final Provider<ObjectivesDataSource> objectivesDataSourceProvider =
    Provider<ObjectivesDataSource>((ref) => ObjectivesDataSource());

class ObjectivesDataSource {
  ObjectivesDataSource();

  Future<List<MokuhyoData>> fetchHistoryObjectivesList() async {
    WidgetsFlutterBinding.ensureInitialized();

    final json = await rootBundle.loadString('images/stub/mokuhyo.json');
    final map = jsonDecode(json);
    return MokuhyoData.toList(map);
  }
}
