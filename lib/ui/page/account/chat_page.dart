import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:monster_habit/state/chat.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

@RoutePage()
class ChatPage extends HookConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      return Column(
                        children: [
                          Expanded(
                              child: ListView.builder(
                                  reverse: true,
                                  itemCount: data.length,
                                  itemBuilder: ((context, index) {
                                    final message = data[index];
                                    return AppText(text: message.content!);
                                  })))
                        ],
                      );
                    },
                    error: (error, stackTrace) => const Center(
                      child: Text('エラーが発生しました。'),
                    ),
                  ));
        });
  }
}
