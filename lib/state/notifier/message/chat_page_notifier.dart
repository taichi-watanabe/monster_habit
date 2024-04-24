import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monster_habit/model/message_data.dart';
import 'package:monster_habit/repository/message/message_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_page_notifier.freezed.dart';
part 'chat_page_notifier.g.dart';

@riverpod
class ChatPageNotifier extends _$ChatPageNotifier {
  @override
  ChatPageItems build() {
    return ChatPageItems();
  }

  void setMessage(String value) {
    state = state.copyWith(message: value);
  }

  Future<void> submitMessage(String uuid) async {
    _showLoading();
    try {
      var _messageData = MessageData(profileId: uuid, content: state.message);
      await ref
          .watch(messageDataRepositoryProvider)
          .submitMessage(_messageData);
    } catch (e) {
      print('Error submitMessage' + e.toString());
      rethrow;
    } finally {
      resetState();
      _hideLoading();
    }
  }

  void resetState() {
    state = state.copyWith(message: '');
  }

  void _showLoading() => state = state.copyWith(isLoading: true);
  void _hideLoading() => state = state.copyWith(isLoading: false);
}

@freezed
class ChatPageItems with _$ChatPageItems {
  factory ChatPageItems({
    @Default('') String message,
    @Default(false) bool isLoading,
  }) = _ChatPageItems;
}
