import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/users_status_data.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:monster_habit/state/notifier/objectives/complete_page_notifier.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';
import 'package:monster_habit/state/users.dart';
import 'package:monster_habit/ui/error/get_error_container.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

@RoutePage()
class ObjectiveCompletePage extends HookConsumerWidget {
  ObjectiveCompletePage(
      {super.key,
      required this.point,
      required this.monsterUrl,
      required this.id});

  final String monsterUrl;
  final int point;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: ref.watch(accessTokenProvider).when(
              data: ((uuid) {
                if (uuid!.isEmpty) {
                  return const UserRegisterPage();
                } else {
                  return _body(ref, context, uuid);
                }
              }),
              error: (error, stacktrace) {
                return Text(error.toString());
              },
              loading: () => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
            ));
  }

  Widget _body(WidgetRef ref, BuildContext context, String uuid) {
    return ref.watch(fetchUserStatusProvider(uuid)).when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stacktrace) => GetErrorContainer(
              onTapRetry: () => ref.invalidate(fetchUserStatusProvider(uuid)),
            ),
        data: (data) {
          final totalPointController = useAnimationController(
              duration: const Duration(milliseconds: 500),
              lowerBound: data.totalPoint!.toDouble(),
              upperBound: (data.totalPoint! + point!).toDouble());
          useAnimation(totalPointController);
          final getPointController = useAnimationController(
              duration: const Duration(milliseconds: 500),
              lowerBound: 0,
              upperBound: point!.toDouble());
          useAnimation(getPointController);

          Future<void> pointUp() async {
            await Future.delayed(const Duration(seconds: 1));
            await getPointController.forward();
            await Future.delayed(const Duration(milliseconds: 500));
            totalPointController.forward();
          }

          useEffect(() {
            pointUp();
            return null;
          }, []);

          return WillPopScope(
            onWillPop: () async => false,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        AppText(
                          text: '目標を達成しました！',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppText(
                          text: '新しいモンスターが仲間になった！早速図鑑を確認してみよう！',
                          fontSize: 16,
                          color: AppColor.gray01,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    _monsterContainer(data),
                    const SizedBox(
                      height: 20,
                    ),
                    _pointContainer(
                        data, totalPointController, getPointController),
                    const SizedBox(
                      height: 40,
                    ),
                    _buttonContainer(context, ref, data),
                  ],
                ),
              ),
              if (ref.watch(completePageNotifierProvider).isLoading)
                FullScreenIndicator(),
            ]),
          );
        });
  }

  Widget _monsterContainer(UsersStatusData data) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.baseGray, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  const AppText(
                    text: '図鑑解放数',
                    fontSize: 11,
                    color: AppColor.gray01,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: data.totalMonster.toString(),
                        fontSize: 32,
                        color: AppColor.statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const AppText(
                        text: '/',
                        fontSize: 26,
                        color: AppColor.gray03,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const AppText(
                        text: '80',
                        fontSize: 26,
                        color: AppColor.gray03,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 100, child: VerticalDivider()),
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  const AppText(
                    text: '仲間になった!',
                    fontSize: 11,
                    color: AppColor.gray01,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: Image(
                      image: NetworkImage(
                        monsterUrl!,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pointContainer(
      UsersStatusData data,
      AnimationController animationController,
      AnimationController getPointController) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.baseGray, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  const AppText(
                    text: '現在の総ポイント',
                    fontSize: 11,
                    color: AppColor.gray01,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: '${animationController.value.toInt()}',
                        fontSize: 32,
                        color: AppColor.statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const AppText(
                        text: 'pt',
                        fontSize: 30,
                        color: AppColor.statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100, child: VerticalDivider()),
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  const AppText(
                    text: '獲得したポイント',
                    fontSize: 11,
                    color: AppColor.gray01,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        text: '+',
                        fontSize: 30,
                        color: AppColor.statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        text: '${getPointController.value.toInt()}',
                        fontSize: 32,
                        color: AppColor.statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const AppText(
                        text: 'pt',
                        fontSize: 30,
                        color: AppColor.statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonContainer(
      BuildContext context, WidgetRef ref, UsersStatusData data) {
    final _completeNotifier = ref.watch(completePageNotifierProvider.notifier);
    return Column(
      children: [
        AppButton(
            textColor: Colors.white,
            backgroundColor: AppColor.blueTextColor,
            height: 60,
            text: '図鑑を見る',
            onPressed: () async {
              _completeNotifier.setTotalPoint(data.totalPoint! + point);
              await _completeNotifier.updateTotalPoint();
              context.router.pushAndPopUntil(
                const CaptureBookRoute(),
                predicate: (route) => false,
              );
            }),
        const SizedBox(
          height: 30,
        ),
        AppButton(
            textColor: Colors.white,
            backgroundColor: AppColor.blueTextColor,
            height: 60,
            text: 'ホームに戻る',
            onPressed: () async {
              _completeNotifier.setTotalPoint(data.totalPoint! + point);
              await _completeNotifier.updateTotalPoint();
              context.router.pushAndPopUntil(
                const HomeRoute(),
                predicate: (route) => false,
              );
            }),
      ],
    );
  }
}
