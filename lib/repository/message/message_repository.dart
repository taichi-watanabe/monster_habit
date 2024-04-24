import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monster_habit/data/service/message_data_source.dart';
import 'package:monster_habit/model/message_data.dart';
import 'package:monster_habit/repository/message/message_repository_impl.dart';

var messageDataRepositoryProvider = Provider<MessageDataRepository>(
  (ref) => MessageDataRepositoryImpl(
      messageRegisterDataSource: ref.watch(messageDataSourceProvider)),
);

abstract class MessageDataRepository {
  MessageDataRepository();
  Stream<List<MessageData>> getChatMessageStream(String uuid);
  Future<void> submitMessage(MessageData data);
  /*Future<ProfileData?> postProfileData(ProfileData profile);
  Future<ProfileData?> fetchUser(String id);
  Future<ProfileData> fetchHomePageData(String id, WidgetRef ref);
  Future<bool> checkUser(String id);*/
}
