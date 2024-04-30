import 'package:freezed_annotation/freezed_annotation.dart';
part 'message_data.freezed.dart';
part 'message_data.g.dart';

@freezed
class MessageData with _$MessageData {
  const factory MessageData({
    int? id,
    String? profileId,
    String? content,
    DateTime? createdAt,
    bool? isMine,
  }) = _MessageData;

  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);

  static List<MessageData> toList(List<dynamic>? json, String myUserId) {
    List<MessageData> _list = [];
    if (json == null) return _list;
    if (json.isEmpty) return _list;

    for (var messgage in json) {
      var messageMap = messgage as Map<String, dynamic>;
      var isMine = myUserId == messageMap['profileId'] ? true : false;
      var message = MessageData.fromJson(messageMap).copyWith(isMine: isMine);
      _list.add(message);
    }
    return _list;
  }
}
