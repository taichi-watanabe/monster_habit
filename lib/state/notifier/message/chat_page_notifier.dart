import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_page_notifier.freezed.dart';
part 'chat_page_notifier.g.dart';

@riverpod
class ChatPageNotifier extends _$ChatPageNotifier {
  @override
  ChatPageItems build() {
    return ChatPageItems();
  }

  void _showLoading() => state = state.copyWith(isLoading: true);
  void _hideLoading() => state = state.copyWith(isLoading: false);
}

@freezed
class ChatPageItems with _$ChatPageItems {
  factory ChatPageItems({
    @Default('') String content,
    @Default(false) bool isLoading,
  }) = _ChatPageItems;
}
