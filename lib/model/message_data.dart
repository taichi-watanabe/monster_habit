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

  factory MessageData.fromJson(Map<String, dynamic> json, String myUserId) =>
      _$MessageDataFromJson(json);

  static List<MessageData> toList(List<dynamic>? json, String myUserId) {
    List<MessageData> _list = [];
    if (json == null) return _list;
    if (json.isEmpty) return _list;

    for (var messgage in json) {
      var _messageMap = messgage as Map<String, dynamic>;

      var _message = MessageData.fromJson(_messageMap, myUserId);
      _list.add(_message);
    }
    _list.map(
        (messgae) => messgae.copyWith(isMine: myUserId == messgae.profileId));
    return _list;
  }
}
