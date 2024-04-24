import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';
import 'package:monster_habit/state/objectives.dart';
import 'package:monster_habit/ui/error/get_error_container.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

@RoutePage()
class MonsterComingPage extends HookConsumerWidget {
  const MonsterComingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(getMonsterUrlProvider).when(
            data: ((url) {
              return _body(context, ref, url);
            }),
            error: (error, stacktrace) => GetErrorContainer(
              onTapRetry: () => ref.invalidate(getMonsterUrlProvider),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }

  Widget _body(BuildContext context, WidgetRef ref, String url) {
    final _state = ref.watch(objectivesNotifierProvider);
    final _notifier = ref.watch(objectivesNotifierProvider.notifier);
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                AppText(
                  text: 'モンスターが現れた！',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: Image(
                image: NetworkImage(
                  url,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppButton(
                backgroundColor: AppColor.blueTextColor,
                height: 60,
                text: '目標登録に進む',
                onPressed: () async {
                  var id = await _notifier.getObjectiveId();
                  context.router.push(ObjectAddRoute(monsterUrl: url, id: id!));
                }),
          ],
        ),
      ),
      if (_state.isLoading) FullScreenIndicator(),
    ]);
  }
}
