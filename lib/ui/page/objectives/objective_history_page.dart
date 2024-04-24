import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/enum/history_objectives_filter_type.dart';
import 'package:monster_habit/model/enum/objective_status_type.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:monster_habit/state/objectives.dart';
import 'package:monster_habit/ui/error/get_error_container.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';
import 'package:speech_balloon/speech_balloon.dart';
import 'package:monster_habit/foundation/extension/date_time_extension.dart';

var historyObjectivesFilterProvider =
    StateProvider<HistoryObjectivesFilterType>(
        ((ref) => HistoryObjectivesFilterType.all));

@RoutePage()
class ObjectiveHistoryPage extends HookConsumerWidget {
  const ObjectiveHistoryPage({super.key});

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
    var _filterType = ref.watch(historyObjectivesFilterProvider);
    return ref.watch(objectivesListProvider(uuid)).when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stacktrace) => GetErrorContainer(
            onTapRetry: () => ref.invalidate(objectivesListProvider(uuid)),
          ),
          data: (data) {
            if (data.isEmpty) {
              return _emptyPage();
            }

            var _filteredData =
                filterObjectives(data, _filterType).toList(growable: false);

            return Scaffold(
              backgroundColor: AppColor.backGroundLightMiddle,
              body: RefreshIndicator(
                onRefresh: () async =>
                    await ref.refresh(objectivesListProvider(uuid)),
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 10, bottom: 20),
                        child: Wrap(
                          spacing: 11,
                          runSpacing: 12,
                          children: List.generate(
                            HistoryObjectivesFilterType.values.length,
                            (index) => InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(99)),
                              onTap: () {
                                ref
                                    .watch(historyObjectivesFilterProvider
                                        .notifier)
                                    .update((state) => state =
                                        HistoryObjectivesFilterType
                                            .values[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _filterType ==
                                          HistoryObjectivesFilterType
                                              .values[index]
                                      ? AppColor.blueTextColor
                                      : Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(99),
                                  ),
                                  border: _filterType ==
                                          HistoryObjectivesFilterType
                                              .values[index]
                                      ? null
                                      : Border.all(color: AppColor.greyText),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                child: Text(
                                  HistoryObjectivesFilterType
                                      .values[index].title,
                                  style: TextStyle(
                                    color: _filterType ==
                                            HistoryObjectivesFilterType
                                                .values[index]
                                        ? const Color(0xffffffff)
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ])),
                    SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                      return _historyObjectivesTile(
                          ref, _filteredData[index], context, uuid);
                    }, childCount: _filteredData.length)),
                  ],
                ),
              ),
            );
          },
        );
  }

  Widget _historyObjectivesTile(WidgetRef ref, ObjectivesData objective,
      BuildContext context, String uuid) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        color: Colors.white,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 10, bottom: 20, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180,
                    child: AppText(
                      text: objective.mokuhyoTitle ?? '',
                      fontSize: 12,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: Image(
                          image: NetworkImage(
                            objective.monsterUrl ?? '',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SpeechBalloon(
                          nipLocation: NipLocation.left,
                          color: Colors.white,
                          height: 35,
                          width: 50,
                          borderColor: AppColor.blueTextColor,
                          borderWidth: 4,
                          nipHeight: 12.0,
                          borderRadius: 10,
                          child: Center(child: Text(objective.status!.title)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              if (objective.status!.title == "達成")
                _statusAchievement(objective)
              else if (objective.status!.title == "失敗")
                _statusFailure()
              else
                _statusRunning(ref, context, objective, uuid)
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusAchievement(ObjectivesData objective) {
    return DefaultTextStyle.merge(
      style: const TextStyle(fontSize: 12),
      child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              _objectiveInfo('達成日',
                  objective.endAt!.formatJstDate().formatYearMonthDayString()),
              const SizedBox(height: 3),
              _objectiveInfo('タスク数', '${objective.taskCount.toString()}個'),
              const SizedBox(height: 3),
              _objectiveInfo(
                  '獲得ポイント', '${objective.archivementPoint.toString()}P')
            ],
          )),
    );
  }

  Widget _objectiveInfo(String text, String info) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(text: text),
          const SizedBox(width: 20),
          AppText(text: info),
        ],
      ),
    );
  }

  Widget _statusFailure() {
    return Container(
      child: DefaultTextStyle.merge(
        style: const TextStyle(fontSize: 11),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: AppText(text: 'ランダムにコメント出す'),
        ),
      ),
    );
  }

  Widget _statusRunning(WidgetRef ref, BuildContext context,
      ObjectivesData objective, String uuid) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.statusColor,
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: AppText(
              text: objective.deadline!.remainingTime(),
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            decoration: BoxDecoration(
                color: AppColor.gray06,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: InkWell(
                onTap: () {
                  context.router
                      .push(ObjectiveEditRoute(
                          objective: objective,
                          monsterUrl: objective.monsterUrl!))
                      .then(
                          (value) => ref.refresh(objectivesListProvider(uuid)));
                },
                child: Row(
                  children: [
                    const AppText(text: '詳細'),
                    const SizedBox(width: 5),
                    SvgPicture.asset('images/svg/angle-right-solid.svg')
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _emptyPage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [SizedBox(height: 40), AppText(text: '現在、目標履歴はありません')],
      ),
    );
  }

  List<ObjectivesData> filterObjectives(
      List<ObjectivesData> objectives, HistoryObjectivesFilterType filterType) {
    switch (filterType) {
      case HistoryObjectivesFilterType.all:
        return objectives;
      case HistoryObjectivesFilterType.achievement:
        return objectives
            .where((objective) =>
                objective.status == ObjectiveStatusType.achievement)
            .toList();
      case HistoryObjectivesFilterType.failure:
        return objectives
            .where(
                (objective) => objective.status == ObjectiveStatusType.failure)
            .toList();
      default:
        return objectives;
    }
  }
}
