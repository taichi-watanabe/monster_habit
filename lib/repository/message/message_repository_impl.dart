import 'package:monster_habit/data/service/message_data_source.dart';
import 'package:monster_habit/model/message_data.dart';
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

  /*@override
  Future<ProfileData?> postProfileData(ProfileData profile) async {
    return await _userRegisterDataSource.postProfileData(profile);
  }

  
  }*/
}
