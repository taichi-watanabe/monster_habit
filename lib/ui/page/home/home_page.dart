import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/model/profile_data.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:monster_habit/state/home/home_page_notifier.dart';
import 'package:monster_habit/state/users.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/indicator/app_indicator.dart';
import 'package:monster_habit/ui/page/home/item/heart_container.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(accessTokenProvider).when(
          data: ((uuid) {
            if (uuid!.isEmpty) {
              return const UserRegisterPage();
            } else {
              return _body(ref, uuid);
            }
          }),
          error: (error, stacktrace) {
            return Text(error.toString());
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }

  Widget _body(WidgetRef ref, String uuid) {
    return Scaffold(
        appBar: AppBar(
          title: const AppText(
            text: "ホーム",
            color: AppColor.mainTextColor,
            fontSize: 20,
          ),
          backgroundColor: AppColor.appMainColor,
          automaticallyImplyLeading: false,
        ),
        body: ref.watch(fetchHomePageDataProvider(uuid, ref)).when(
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (error, stackTrace) => const Center(
                  child: Text('エラーが発生しました'),
                ),
            data: (data) {
              if (data.usersStatus == null) {
                return RefreshIndicator(
                    onRefresh: () async =>
                        await ref.refresh(fetchHomePageDataProvider(uuid, ref)),
                    child: const Center(child: Text('エラーが発生しました')));
              }
              return WillPopScope(
                onWillPop: () async => false,
                child: RefreshIndicator(
                  onRefresh: () async =>
                      await ref.refresh(fetchHomePageDataProvider(uuid, ref)),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate([
                        _homePageTop(data.objectives!, ref),
                        const SizedBox(
                          height: 15,
                        )
                      ])),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        _statusWidget(ref, data),
                        const SizedBox(
                          height: 15,
                        )
                      ])),
                      SliverList(
                          delegate: SliverChildListDelegate([_graph(ref)]))
                    ],
                  ),
                ),
              );
            }));
  }
}

Widget _graph(WidgetRef ref) {
  return Padding(
    padding: const EdgeInsets.only(right: 17, left: 17),
    child: Container(
      decoration: BoxDecoration(
          color: AppColor.widgetBackColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12, left: 17, right: 17, bottom: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text: 'Graph',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColor.blueTextColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                  color: AppColor.appMainColor,
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _statusWidget(WidgetRef ref, ProfileData data) {
  return Padding(
    padding: const EdgeInsets.only(right: 17, left: 17),
    child: Container(
      decoration: BoxDecoration(
          color: AppColor.widgetBackColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12, left: 17, right: 17, bottom: 37),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text: 'Status',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColor.blueTextColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        color: AppColor.appMainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 6),
                          child: AppText(
                            text: 'プロフィール',
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Center(
                          child: Column(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  fixedSize: const Size(70, 70),
                                  shape: const CircleBorder(),
                                ),
                                onPressed: () {},
                                child: Text(''),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              AppText(
                                text: data.userName,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        color: AppColor.appMainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, top: 6),
                          child: AppText(
                            text: 'スタミナ',
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Center(child: heartContainer(ref))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                  color: AppColor.appMainColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(top: 6, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      text: 'レベル',
                      fontSize: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 33),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: const Size(70, 70),
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                AppText(
                                  text: '999',
                                  fontSize: 20,
                                  color: AppColor.blueTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                AppText(
                                  text: 'Lvl',
                                  fontSize: 10,
                                  color: AppColor.greyText,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              AppText(
                                text: '次のレベルまであと... 99/100 P',
                                fontSize: 10,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AppIndicator(
                                isCircular: false,
                                width: 145,
                                height: 16,
                                value: 0.5,
                                valueColor: AppColor.statusColor,
                                minHeight: 20,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget _homePageTop(List<ObjectivesData> objectives, WidgetRef ref) {
  return Container(
    height: 130,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 42.0,
            lineWidth: 3.0,
            center: const Icon(
              Icons.abc,
            ),
            percent: 0,
            backgroundColor: Colors.white,
            footer: const AppText(
              text: '新規追加',
              fontSize: 10,
            ),
          ),
          const SizedBox(width: 13), // 余白を追加
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            itemCount: objectives.length,
            itemBuilder: (context, index) {
              final objective = objectives[index];
              return Row(
                children: [
                  AppIndicator(
                    isCircular: true,
                    radius: 42,
                    lineWidth: 7,
                    value: (objective.archivementPoint / objective.totalPoint),
                    centerWidget: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.network(
                        objective.monsterUrl!,
                      ),
                    ),
                    valueColor: AppColor.statusColor,
                    backGroundColor: AppColor.gray05,
                    backgroundWidth: 7,
                    footerWidget: Flexible(
                      child: Container(
                        width: 65,
                        child: AppText(
                          textAlign: TextAlign.center,
                          text: objective.mokuhyoTitle!,
                          textOverflow: TextOverflow.ellipsis,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget _emptyPage() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: const Padding(
      padding: EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: AppText(text: '現在設定中の目標はありません'),
      ),
    ),
  );
}
