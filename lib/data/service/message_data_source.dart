import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/message_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<MessageDataSource> messageDataSourceProvider =
    Provider<MessageDataSource>((ref) => MessageDataSource());

final supabase = Supabase.instance.client;

class MessageDataSource {
  MessageDataSource();

  Stream<List<MessageData>> getChatMessageStream(String uuid) {
    return supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at')
        .map((maps) => MessageData.toList(maps, uuid));
  }
}
