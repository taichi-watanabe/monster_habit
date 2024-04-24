import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:monster_habit/model/capture_data.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<ObjectivesDataSource> objectivesDataSourceProvider =
    Provider<ObjectivesDataSource>((ref) => ObjectivesDataSource());

final supabase = Supabase.instance.client;

class ObjectivesDataSource {
  ObjectivesDataSource();

  //目標を登録
  Future<ObjectivesData?> putObjectives(ObjectivesData data) async {
    return await supabase.from('objectives').update({
      'totalPoint': data.totalPoint.toDouble(),
      'archivementPoint': data.archivementPoint.toDouble(),
      'mokuhyoTitle': data.mokuhyoTitle,
      'mokuhyoMemo': data.mokuhyoMemo,
      'taskCount': data.taskCount,
      'monsterUrl': data.monsterUrl,
      'beginAt': data.beginAt,
      'deadline': data.deadline
    }).match({'id': data.id, 'uuid': data.uuid});
  }

  //目標テーブルからidが一致するレコードを取得する
  Future<ObjectivesData?> getObjective(String uuid, int id) async {
    return await supabase
        .from('objectives')
        .select()
        .match({'uuid': uuid, 'id': id})
        .single()
        .then((value) => ObjectivesData.fromJson(value));
  }

  //目標テーブルを作成し、idを取得する。dashbordページで適用。
  Future<int?> getObjectiveId(String uuid) async {
    return await supabase.from('objectives').insert({
      'uuid': uuid,
    }).then((value) async {
      return await supabase
          .from('objectives')
          .select('id')
          .eq('uuid', uuid)
          .then((value) {
        return value.last['id'] as int;
      });
    });
  }

  //目標一覧を取得
  Future<List<ObjectivesData>> fetchObjectivesList(String id) async {
    return await supabase
        .from('objectives')
        .select()
        .eq('uuid', id)
        .then((value) => ObjectivesData.toList(value));
  }

  //目標テーブルを削除
  Future<void> deleteObjective(ObjectivesData data) async {
    return await supabase
        .from('objectives')
        .delete()
        .match({'uuid': data.uuid, 'id': data.id});
  }

  //目標を達成
  Future<void> completeObjective(ObjectivesData data) async {
    return await supabase.from('objectives').update({
      'totalPoint': data.totalPoint.toDouble(),
      'archivementPoint': data.archivementPoint,
      'status': 'achievement',
      'endAt': data.endAt,
      'deadline': data.deadline,
      'mokuhyoTitle': data.mokuhyoTitle,
      'mokuhyoMemo': data.mokuhyoMemo,
      'taskCount': data.taskCount,
    }).match({'uuid': data.uuid, 'id': data.id});
  }

  //目標を失敗
  Future<void> failedObjective(ObjectivesData data) async {
    return await supabase.from('objectives').update({
      'archivementPoint': data.archivementPoint,
      'status': 'failure',
      'endAt': data.endAt,
    }).match({'uuid': data.uuid, 'id': data.id});
  }

  //モンスターの画像URLを取得
  Future<String> getMonsterUrl() async {
    List<String> fileUrlList = [];
    // バケット内のすべてのファイルのメタデータを取得
    final fileList =
        await supabase.storage.from('monster_images').list(path: 'level_1');

    // 各ファイルのメタデータからURLを取得してコンソールに出力
    for (final file in fileList) {
      final String fileUrl = supabase.storage
          .from('monster_images')
          .getPublicUrl('level_1/${file.name}')
          .toString();
      fileUrlList.add(fileUrl);
    }
    fileUrlList.shuffle();
    return fileUrlList[0];
  }

  //taskを登録
  Future<TaskData?> putTask(TaskData data) async {
    return await supabase.from('task').insert({
      'objective_id': data.objectiveId,
      'taskTitle': data.taskTitle,
      'exPoint': data.exPoint
    });
  }

  //taskを編集
  Future<void> editTask(TaskData data) async {
    return await supabase
        .from('task')
        .update({'taskTitle': data.taskTitle, 'exPoint': data.exPoint}).match(
            {'id': data.id});
  }

  //taskを完了
  Future<void> completeTask(int id) async {
    return await supabase
        .from('task')
        .update({'status': 'complete'}).match({'id': id});
  }

  //taskを削除
  Future<void> deleteTask(int id) async {
    return await supabase.from('task').delete().match({'id': id});
  }

  //task一覧を取得
  Future<List<TaskData>?> fetchTaskList(int id) async {
    final taskList = await supabase
        .from('objectives')
        .select('task(id,taskTitle,exPoint,status)')
        .eq('id', id);
    print(taskList);
    if (taskList.isEmpty) {
      return [];
    } else {
      return TaskData.toList(taskList);
    }
  }

  Future<List<ObjectivesData>> fetchHistoryObjectivesList() async {
    WidgetsFlutterBinding.ensureInitialized();

    final json = await rootBundle.loadString('images/stub/mokuhyo.json');
    final map = jsonDecode(json);
    return ObjectivesData.toList(map);
  }

  Future<List<CaptureData>> fetchCaptureBooksList() async {
    WidgetsFlutterBinding.ensureInitialized();

    String jsonData = await rootBundle.loadString('images/stub/capture.json');
    var jsonMap = json.decode(jsonData) as Map<String, dynamic>;
    var captureListJson = jsonMap['uuid_1'] as List<dynamic>;

    return CaptureData.toList(captureListJson);
  }

  Future saveObjectives(ObjectivesData objectives) async {
    final objectivesMap = objectives.toJson();
    final objectivesJson = jsonEncode(objectivesMap);
    debugPrint('objectivesJsonの中身は、${objectivesJson}');
  }

  Future saveObjectiveTasks(TaskData tasks) async {
    final tasksMap = tasks.toJson();
    final tasksJson = jsonEncode(tasksMap);
    debugPrint('objectivesJsonの中身は、${tasksJson}');
  }
}
