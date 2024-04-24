import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/message_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<MessageDataSource> messageDataSourceProvider =
    Provider<MessageDataSource>((ref) => MessageDataSource());

final supabase = Supabase.instance.client;

class MessageDataSource {
  MessageDataSource();

  //メッセージ一覧を取得
  Stream<List<MessageData>> getChatMessageStream(String uuid) {
    return supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => MessageData.toList(maps, uuid));
  }

  //メッセージを送信する
  Future<void> submitMessage(MessageData data) async {
    return supabase
        .from('messages')
        .insert({'profile_id': data.profileId, 'content': data.content});
  }
}
