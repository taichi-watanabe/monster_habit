import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:monster_habit/model/message_data.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:monster_habit/state/chat.dart';
import 'package:monster_habit/state/notifier/message/chat_page_notifier.dart';
import 'package:monster_habit/ui/form/app_form.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';
import 'package:monster_habit/foundation/extension/date_time_extension.dart';

@RoutePage()
class ChatPage extends HookConsumerWidget {
  ChatPage({super.key});

  final _messageFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _messageNotifier = ref.watch(chatPageNotifierProvider.notifier);
    final _messageState = ref.watch(chatPageNotifierProvider);
    var _textController = useTextEditingController(text: _messageState.message);
    var _messageFocueNode = useFocusNode();

    return ref.watch(accessTokenProvider).when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stackTrace) => const Center(
              child: Text('エラーが発生しました'),
            ),
        data: (uuid) {
          if (uuid!.isEmpty) {
            return const UserRegisterPage();
          }

          return Scaffold(
              appBar: AppBar(
                title: const AppText(
                  text: "お問い合わせ（チャット）",
                  color: AppColor.mainTextColor,
                  fontSize: 20,
                ),
                backgroundColor: AppColor.appMainColor,
                automaticallyImplyLeading: false,
              ),
              body: ref.watch(getMessageDataProvider(uuid)).when(
                    loading: () => null,
                    data: (data) {
                      useFuture(useMemoized((() {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          await _messageNotifier.checkMessagesId(data);
                        });
                        _messageFocueNode.addListener(
                          () {
                            if (!_messageFocueNode.hasFocus) {
                              _messageFieldKey.currentState?.validate();
                            }
                          },
                        );
                        return null;
                      })));

                      return ref.watch(cacheProfileDataProvider(data)).when(
                          error: (error, stackTrace) => Center(
                                child: Text('エラーが発生しました。${error.toString()}'),
                              ),
                          loading: () => const Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                          data: (cacheData) {
                            return GestureDetector(
                              onTap: () {
                                _messageFocueNode.unfocus();
                              },
                              child: Stack(children: [
                                Column(
                                  children: [
                                    Expanded(
                                        child: ListView.builder(
                                            reverse: true,
                                            itemCount: data.length,
                                            itemBuilder: ((context, index) {
                                              final message = data[index];
                                              return _chatBubble(ref, message,
                                                  cacheData[message.profileId]);
                                            }))),
                                    SafeArea(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: AppForm(
                                                textInputType:
                                                    TextInputType.text,
                                                focusNode: _messageFocueNode,
                                                fieldKey: _messageFieldKey,
                                                maxLines: null,
                                                controller: _textController,
                                                hintText: 'メッセージを入力',
                                                onChanged: (value) {
                                                  _messageNotifier
                                                      .setMessage(value);
                                                },
                                              ),
                                            ),
                                            _messageState.message.isEmpty
                                                ? const Icon(
                                                    Icons.message,
                                                    color: AppColor.statusColor,
                                                    size: 40,
                                                  )
                                                : InkWell(
                                                    onTap: () async {
                                                      _textController.clear();
                                                      _messageFocueNode
                                                          .unfocus();
                                                      await _messageNotifier
                                                          .submitMessage(uuid);
                                                    },
                                                    child: const Icon(
                                                      Icons.send,
                                                      color:
                                                          AppColor.statusColor,
                                                      size: 40,
                                                    ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (_messageState.isLoading)
                                  const FullScreenIndicator(
                                    nullColor: true,
                                  )
                              ]),
                            );
                          });
                    },
                    error: (error, stackTrace) => Center(
                      child: Text('エラーが発生しました。${error.toString()}'),
                    ),
                  ));
        });
  }

  Widget _chatBubble(WidgetRef ref, MessageData message, ProfileData? profile) {
    List<Widget> chatContents = [
      if (!message.isMine!)
        CircleAvatar(
          child: Text(profile!.userName.substring(0, 2)),
        ),
      const SizedBox(width: 12),
      Flexible(
        child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: message.isMine! ? AppColor.appMainColor : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: AppText(text: message.content!)),
      ),
      const SizedBox(width: 12),
      AppText(
          text: message.createdAt
              .toString()
              .formatJstDate()
              .formatTimeString()), // 時
    ];
    if (message.isMine!) {
      chatContents = chatContents.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment:
            message.isMine! ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: chatContents,
      ),
    );
  }
}
