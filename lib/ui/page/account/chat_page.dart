import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:monster_habit/state/chat.dart';
import 'package:monster_habit/state/notifier/message/chat_page_notifier.dart';
import 'package:monster_habit/ui/form/app_form.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

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

    useFuture(useMemoized((() {
      _messageFocueNode.addListener(
        () {
          if (!_messageFocueNode.hasFocus) {
            _messageFieldKey.currentState?.validate();
          }
        },
      );
      return null;
    })));
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
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (data) {
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
                                        return AppText(text: message.content!);
                                      }))),
                              SafeArea(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: AppForm(
                                        textInputType: TextInputType.text,
                                        focusNode: _messageFocueNode,
                                        fieldKey: _messageFieldKey,
                                        maxLines: null,
                                        controller: _textController,
                                        hintText: 'メッセージを入力',
                                        onChanged: (value) {
                                          _messageNotifier.setMessage(value);
                                        },
                                      ),
                                    ),
                                    _messageState.message.isEmpty
                                        ? const Icon(Icons.message)
                                        : InkWell(
                                            onTap: () async {
                                              _textController.clear();
                                              _messageFocueNode.unfocus();
                                              await _messageNotifier
                                                  .submitMessage(uuid);
                                            },
                                            child: const Icon(Icons.send))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (_messageState.isLoading) FullScreenIndicator()
                        ]),
                      );
                    },
                    error: (error, stackTrace) => const Center(
                      child: Text('エラーが発生しました。'),
                    ),
                  ));
        });
  }
}
