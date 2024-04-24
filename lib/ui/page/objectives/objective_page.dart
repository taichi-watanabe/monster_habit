import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/enum/objective_status_type.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';

import 'package:monster_habit/state/objectives.dart';
import 'package:monster_habit/ui/error/get_error_container.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/indicator/app_indicator.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

var objectivesFilterProvider =
    StateProvider<ObjectiveStatusType>(((ref) => ObjectiveStatusType.running));

@RoutePage()
class ObjectPage extends HookConsumerWidget {
  const ObjectPage({super.key});

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
    var _filterType = ref.watch(objectivesFilterProvider);
    return ref.watch(objectivesListProvider(uuid)).when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stacktrace) => GetErrorContainer(
              onTapRetry: () => ref.invalidate(objectivesListProvider(uuid)),
            ),
        data: (data) {
          var dataList = filterObjectives(data, _filterType);
          if (dataList.isEmpty) {
            return Scaffold(
                body: RefreshIndicator(
                    onRefresh: () async =>
                        await ref.refresh(objectivesListProvider(uuid)),
                    child: CustomScrollView(slivers: [
                      SliverList(
                          delegate: SliverChildListDelegate([_emptyPage()]))
                    ])));
          }

          useOnAppLifecycleStateChange((_, state) async {
            if (state == AppLifecycleState.resumed) {
              final List<ObjectivesData> filteredDataList =
                  dataList.where((data) {
                return data.deadline != null &&
                    DateTime.parse(data.deadline!).isBefore(DateTime.now());
              }).toList();
              if (filteredDataList.isEmpty) {
                return;
              } else {
                filteredDataList.forEach((data) {
                  ref
                      .watch(objectivesNotifierProvider.notifier)
                      .deadlinedObjective(data)
                      .then(
                          (value) => ref.refresh(objectivesListProvider(uuid)));
                });
              }
            }
          });

          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async =>
                  await ref.refresh(objectivesListProvider(uuid)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      const AppText(
                        text: '捕獲中...',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ])),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                      return objectivesCard(
                          dataList[index], ref, context, uuid);
                    }, childCount: dataList.length)),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget objectivesCard(ObjectivesData objective, WidgetRef ref,
      BuildContext context, String uuid) {
    return InkWell(
      onTap: () async {
        await context.router
            .push(ObjectiveEditRoute(
                objective: objective, monsterUrl: objective.monsterUrl!))
            .then((value) => ref.refresh(objectivesListProvider(uuid)));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: AppText(
                        text: objective.mokuhyoTitle ?? '',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppText(text: objective.taskCount.toString()),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        AppIndicator(
                          isCircular: true,
                          radius: 42,
                          lineWidth: 9,
                          value:
                              objective.archivementPoint / objective.totalPoint,
                          backGroundColor: AppColor.gray04,
                          backgroundWidth: 9,
                          valueColor: AppColor.statusColor,
                          centerWidget: Text(
                              '${((objective.archivementPoint / objective.totalPoint) * 100).toInt()}%'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 110,
                child: Image.network(
                  objective.monsterUrl!,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _emptyPage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                  width: 230,
                  height: 230,
                  child: SvgPicture.asset('images/svg/relax.svg')),
              const SizedBox(height: 90),
              const AppText(
                text: '現在設定中の目標はありません',
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ObjectivesData> filterObjectives(
      List<ObjectivesData> objectives, ObjectiveStatusType filterType) {
    // fund.statusがdisableの場合は、表示しない
    objectives = objectives
        .where((objective) => objective.status == ObjectiveStatusType.running)
        .toList();

    return objectives;
  }
}
