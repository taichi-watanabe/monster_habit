import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/message_data.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final Provider<MessageDataSource> messageDataSourceProvider =
    Provider<MessageDataSource>((ref) => MessageDataSource());

final supabase = Supabase.instance.client;

class MessageDataSource {
  MessageDataSource();

  //メッセージ一覧を取得
  Stream<List<MessageData>> getChatMessageStream(String uuid) {
    final _messageStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('createdAt')
        .map((maps) => MessageData.toList(maps, uuid));
    return _messageStream;
  }

  /// 特定のユーザーのプロフィール情報をロードしてキャッシュする
  Future<ProfileData> loadProfileCache(String profileId) async {
    final data =
        await supabase.from('users').select().eq('uuid', profileId).single();
    final profile = ProfileData.fromJson(data);
    return profile;
  }

  Future<Map<String, ProfileData>> cacheProfileData(
      List<MessageData> data) async {
    final Map<String, ProfileData> _profileCache = {};
    for (final message in data) {
      if (_profileCache[message.profileId!] == null) {
        final profile = await loadProfileCache(message.profileId!);
        _profileCache[message.profileId!] = profile;
      }
    }
    return _profileCache;
  }

  //メッセージを送信する
  Future<void> submitMessage(MessageData data) async {
    return supabase
        .from('messages')
        .insert({'profileId': data.profileId, 'content': data.content});
  }
}
