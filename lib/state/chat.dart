import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/message_data.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:monster_habit/repository/message/message_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.g.dart';

//ホームページ用のuserDataをfetch
@riverpod
Stream<List<MessageData>> getMessageData(GetMessageDataRef ref, String id) {
  return ref.watch(messageDataRepositoryProvider).getChatMessageStream(id);
}

@riverpod
Future<Map<String, ProfileData>> cacheProfileData(
    CacheProfileDataRef ref, List<MessageData> data) {
  return ref.watch(messageDataRepositoryProvider).cacheProfileData(data);
}
