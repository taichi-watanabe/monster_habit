import 'package:monster_habit/data/service/message_data_source.dart';
import 'package:monster_habit/model/message_data.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:monster_habit/repository/message/message_repository.dart';

class MessageDataRepositoryImpl implements MessageDataRepository {
  MessageDataRepositoryImpl(
      {required MessageDataSource messageRegisterDataSource})
      : _messageRegisterDataSource = messageRegisterDataSource;

  final MessageDataSource _messageRegisterDataSource;

  @override
  Stream<List<MessageData>> getChatMessageStream(String uuid) {
    return _messageRegisterDataSource.getChatMessageStream(uuid);
  }

  @override
  Future<ProfileData> loadProfileCache(String profileId) async {
    return await _messageRegisterDataSource.loadProfileCache(profileId);
  }

  @override
  Future<void> submitMessage(MessageData data) async {
    return await _messageRegisterDataSource.submitMessage(data);
  }

  @override
  Future<Map<String, ProfileData>> cacheProfileData(
      List<MessageData> data) async {
    return await _messageRegisterDataSource.cacheProfileData(data);
  }
}
