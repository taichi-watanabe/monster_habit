// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/foundation/extension/date_time_extension.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/state/access_token.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';
import 'package:monster_habit/state/notifier/tasks/task_notifier.dart';
import 'package:monster_habit/state/tasks.dart';
import 'package:monster_habit/ui/form/app_form.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/dialog/custom_dialog.dart';
import 'package:monster_habit/ui/widget/dialog/objective/objective_complete_dialog.dart';
import 'package:monster_habit/ui/widget/dialog/objective/objective_failed_dialog.dart';
import 'package:monster_habit/ui/widget/dialog/objective/objective_register_dialog.dart';
import 'package:monster_habit/ui/widget/indicator/app_indicator.dart';
import 'package:monster_habit/ui/widget/indicator/app_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';
import 'dart:math' as math;

import 'package:monster_habit/ui/widget/text/app_text.dart';

@RoutePage()
class ObjectiveEditPage extends HookConsumerWidget {
  ObjectiveEditPage(
      {super.key, required this.objective, required this.monsterUrl});

  final _titleFieldKey = GlobalKey<FormFieldState>();
  final _memoFieldKey = GlobalKey<FormFieldState>();
  final _dateFieldKey = GlobalKey<FormFieldState>();
  final ObjectivesData objective;
  final String monsterUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(accessTokenProvider).when(
          data: ((uuid) {
            if (uuid!.isEmpty) {
              return const UserRegisterPage();
            } else {
              return _objectiveAdd(ref, context, uuid);
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

  Widget _objectiveAdd(WidgetRef ref, BuildContext context, uuid) {
    final _notifier = ref.watch(objectivesNotifierProvider.notifier);
    final _state = ref.watch(objectivesNotifierProvider);
    final _titleFocusNode = useFocusNode();
    final _memoFocusNode = useFocusNode();
    final _dateFocusNode = useFocusNode();

    return Scaffold(
        body: ref.watch(taskListProvider(objective.id!)).when(
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColor.appMainColor,
                  ),
                ),
            error: (error, stackTrace) => const Center(
                  child: Text('エラーが発生しました'),
                ),
            data: (data) {
              var dataList = data!.toList(growable: false);
              var totalPoint = calculateTotalExPoint(data);

              useEffect(() {
                if (dataList.isNotEmpty) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _notifier.isTaskList(dataList);
                    _notifier.setObjectiveData(objective);
                  });
                }
                return null;
              }, []);

              return Scaffold(
                appBar: AppBar(
                  title: const AppText(
                    text: "目標編集",
                    color: AppColor.mainTextColor,
                    fontSize: 20,
                  ),
                  backgroundColor: AppColor.appMainColor,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Center(
                          child: InkWell(
                        onTap: (() async {
                          showCustomDialog(
                                  context, const ObjectiveFailedDialog())
                              .then((value) => value != null
                                  ? value
                                      ? context.router
                                          .popUntil(((route) => route.isFirst))
                                      : false
                                  : false);
                        }),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.mood_bad,
                                    color: AppColor.black01,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  AppText(
                                    text: '諦める',
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            )),
                      )),
                    )
                  ],
                  leading: TextButton(
                      child: const Icon(Icons.leak_add),
                      onPressed: () async {
                        if (dataList.isEmpty) {
                          showCustomDialog(
                              context,
                              const ObjectiveRegisterDialog(
                                title: 'タスクを登録しよう！',
                              ));
                        } else {
                          _notifier.setTaskCount(dataList.length);
                          _notifier.setTotalPoint(totalPoint);
                          await _notifier.putObjectives(objective.id!, true);
                          context.router.pop();
                        }
                      }),
                ),
                body: GestureDetector(
                  onTap: () {
                    _titleFocusNode.unfocus();
                    _memoFocusNode.unfocus();
                    _dateFocusNode.unfocus();
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: RefreshIndicator(
                          onRefresh: () async => await ref
                              .refresh(taskListProvider(objective.id!)),
                          child: CustomScrollView(slivers: [
                            SliverList(
                                delegate: SliverChildListDelegate([
                              _objectiveWidget(ref, totalPoint, _titleFocusNode,
                                  _memoFocusNode, _dateFocusNode, context)
                            ])),
                            SliverPadding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              sliver: SliverList(
                                  delegate: SliverChildListDelegate([
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const AppText(text: 'タスク一覧'),
                                    AppButton(
                                      backgroundColor: AppColor.appMainColor,
                                      text: '',
                                      onPressed: () {
                                        ref
                                            .watch(
                                                taskNotifierProvider.notifier)
                                            .resetState();

                                        context.router
                                            .push(ObjectiveAddTaskRoute(
                                              objectiveId: objective.id!,
                                            ))
                                            .then((value) => ref.refresh(
                                                taskListProvider(
                                                    objective.id!)));
                                      },
                                      width: 100,
                                      height: 25,
                                      fontSize: 10,
                                      icon: Icons.add,
                                    )
                                  ],
                                )
                              ])),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.only(bottom: 15),
                              sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                if (dataList.isEmpty) {
                                  return Container();
                                } else {
                                  return taskCard(
                                      dataList[index],
                                      context,
                                      ref,
                                      objective.id!,
                                      totalPoint,
                                      dataList.length);
                                }
                              }, childCount: dataList.length)),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.only(bottom: 50),
                              sliver: SliverList(
                                  delegate: SliverChildListDelegate([
                                StatefulBuilder(builder: (context, setState) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AppButton(
                                        width: 150,
                                        height: 50,
                                        backgroundColor:
                                            Color.fromARGB(255, 45, 77, 104),
                                        textColor: Colors.white,
                                        text: '保存する',
                                        onPressed: () async {
                                          if (dataList.isEmpty) {
                                            showCustomDialog(
                                                context,
                                                const ObjectiveRegisterDialog(
                                                  title: 'タスクを登録しよう！',
                                                ));
                                          } else {
                                            if (_state
                                                .checkObjectivePageButton) {
                                              _notifier.setTaskCount(
                                                  dataList.length);
                                              _notifier
                                                  .setTotalPoint(totalPoint);
                                              await _notifier.putObjectives(
                                                  objective.id!, true);
                                              context.router.popUntil(
                                                  ((route) => route.isFirst));
                                            } else {
                                              return null;
                                            }
                                          }
                                        },
                                      ),
                                      AppButton(
                                          width: 150,
                                          height: 50,
                                          backgroundColor:
                                              _state.archivementPoint !=
                                                      totalPoint
                                                  ? AppColor.gray04
                                                  : AppColor.blueTextColor,
                                          textColor: _state.archivementPoint !=
                                                  totalPoint
                                              ? null
                                              : Colors.white,
                                          text: '達成する',
                                          onPressed: () async {
                                            if (_state.archivementPoint !=
                                                totalPoint) {
                                              return;
                                            }
                                            showCustomDialog(
                                                context,
                                                ObjectiveCompleteDialog(
                                                  totalPoint: totalPoint,
                                                )).then((value) => value != null
                                                ? value
                                                    ? context.router
                                                        .pushAndPopUntil(
                                                        ObjectiveCompleteRoute(
                                                            monsterUrl:
                                                                monsterUrl,
                                                            point: totalPoint
                                                                .toInt(),
                                                            id: objective.id!),
                                                        predicate: (route) =>
                                                            false,
                                                      )
                                                    : false
                                                : false);
                                          })
                                    ],
                                  );
                                }),
                              ])),
                            ),
                          ]),
                        ),
                      ),
                      if (_state.isLoading) FullScreenIndicator(),
                    ],
                  ),
                ),
              );
            }));
  }

  Widget _objectiveWidget(WidgetRef ref, double totalPoint, _titleFocusNode,
      _memoFocusNode, _dateForcusNode, context) {
    final _state = ref.watch(objectivesNotifierProvider);
    final _notifier = ref.watch(objectivesNotifierProvider.notifier);
    final _titileController =
        useTextEditingController(text: objective.mokuhyoTitle);
    final _dateController = useTextEditingController(text: objective.deadline);

    final _animationController =
        useAnimationController(duration: const Duration(milliseconds: 1000));

    useFuture(useMemoized((() {
      _titleFocusNode.addListener(
        () {
          if (!_titleFocusNode.hasFocus) {
            _titleFieldKey.currentState?.validate();
          }
        },
      );
      _dateForcusNode.addListener(
        () {
          if (!_dateForcusNode.hasFocus) {
            _dateFieldKey.currentState?.validate();
          }
        },
      );
      _animationController.repeat();
      return null;
    })));

    return Container(
      decoration: BoxDecoration(
          color: AppColor.widgetBackColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 13, left: 13, right: 13, bottom: 13),
        child: Column(
          children: [
            Container(
              height: 206,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.appMainColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) => Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: f(_animationController.value,
                                context), // 高さが sin関数に従って変化する
                            width: 100,
                            child: Image(
                              image: NetworkImage(
                                objective.monsterUrl!,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const AppText(
                    text: '仲間になるまで残り....',
                    fontSize: 10,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIndicator(
                        isCircular: false,
                        width: 200,
                        height: 12,
                        value: _state.archivementPoint / totalPoint,
                        valueColor: AppColor.statusColor,
                        minHeight: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppText(
                        text:
                            '${_state.archivementPoint.toInt()} / ${totalPoint.toInt()}',
                        fontSize: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: 'タイトル',
                  fontSize: 10,
                ),
                const SizedBox(
                  height: 3,
                ),
                AppForm(
                  controller: _titileController,
                  validationCallBack: (value) =>
                      _notifier.titleValidator(value),
                  focusNode: _titleFocusNode,
                  fieldKey: _titleFieldKey,
                  fillColor: Colors.white,
                  hintText: '旅行の準備をする',
                  textInputType: TextInputType.text,
                  onChanged: (value) {
                    _notifier.setObjectivesTitle(value);
                    if (_titleFieldKey.currentState?.hasError == true) {
                      _titleFieldKey.currentState?.validate();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: '期限',
                  fontSize: 10,
                ),
                const SizedBox(
                  height: 3,
                ),
                AppForm(
                  controller: _dateController,
                  validationCallBack: (value) => _notifier.dateValidator(value),
                  focusNode: _dateForcusNode,
                  fieldKey: _dateFieldKey,
                  fillColor: Colors.white,
                  hintText: '日付を入力してください',
                  icon: IconButton(
                    icon: const Icon(Icons.calendar_month),
                    onPressed: () async {
                      DateTime initDate =
                          DateTime.now().add(const Duration(days: 1));

                      try {
                        initDate.formatDateTimeString();
                      } catch (_) {}

                      // DatePickerを表示する
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: initDate,
                        firstDate: initDate,
                        lastDate: DateTime.now().add(
                          Duration(days: 3),
                        ),
                        locale: const Locale('ja'),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppColor.appMainColor,
                                onPrimary:
                                    AppColor.blueTextColor, // 選択時のテキストカラー
                                onSurface: Colors.black, // カレンダーのテキストカラー
                                surfaceTint:
                                    Colors.transparent, // カレンダーにうっすらかかる色
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      // DatePickerで取得した日付を文字列に変換
                      String? formatedDate;
                      try {
                        formatedDate = picked!.formatDateTimeString();
                      } catch (_) {}
                      if (formatedDate != null) {
                        _notifier.setObjectivesDeadline(formatedDate);
                        _dateController.text = formatedDate;
                      }
                    },
                  ),
                  onChanged: (value) {
                    _notifier.setObjectivesDeadline(value);
                    if (_dateFieldKey.currentState?.hasError == true) {
                      _dateFieldKey.currentState?.validate();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  text: 'メモ',
                  fontSize: 10,
                ),
                const SizedBox(
                  height: 3,
                ),
                AppForm(
                  fieldKey: _memoFieldKey,
                  focusNode: _memoFocusNode,
                  initialValue: objective.mokuhyoMemo,
                  maxLines: 6,
                  fillColor: Colors.white,
                  textInputType: TextInputType.multiline,
                  onChanged: (value) {
                    _notifier.setObjectivesMemo(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget taskCard(TaskData data, BuildContext context, WidgetRef ref, int id,
      double totalPoint, int length) {
    final _notifier = ref.watch(taskNotifierProvider.notifier);
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      color: data.status == 'complete' ? AppColor.gray03 : Colors.white,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, top: 15, bottom: 15, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: data.taskTitle ?? '',
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppSlider(
                    width: 200,
                    value: data.exPoint ?? 0,
                    onChanged: (value) {
                      null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _notifier.setExPoint(data.exPoint!);
                    _notifier.setTaskTitle(data.taskTitle!);
                    context.router
                        .push(ObjectiveAddTaskRoute(task: data, fromEdit: true))
                        .then((value) => ref.refresh(taskListProvider(id)));
                  },
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(
                      'images/svg/typcn_edit.svg',
                      color: AppColor.blueTextColor,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () async {
                    if (length == 1) {
                      showCustomDialog(
                          context,
                          const ObjectiveRegisterDialog(
                            title: 'タスクは１つ以上登録しよう！',
                          ));
                      return;
                    }
                    _deleteTaskDialog(context, _notifier, data, ref, id);
                  },
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(
                      'images/svg/material-symbols_delete-outline.svg',
                      color: AppColor.blueTextColor,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                InkWell(
                  onTap: () async {
                    await _completeTaskDialog(
                            context, _notifier, data, ref, id, totalPoint)
                        .then((result) {
                      if (result == true) {
                        Future.delayed(const Duration(seconds: 1)).then((_) {
                          showCustomDialog(
                              context,
                              ObjectiveCompleteDialog(
                                totalPoint: totalPoint,
                              )).then((value) => value != null
                              ? value
                                  ? context.router.pushAndPopUntil(
                                      ObjectiveCompleteRoute(
                                          monsterUrl: monsterUrl,
                                          point: totalPoint.toInt(),
                                          id: objective.id!),
                                      predicate: (route) => false,
                                    )
                                  : false
                              : false);
                        });
                      } else {
                        return;
                      }
                    });
                  },
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(
                      'images/svg/cil_check.svg',
                      color: AppColor.blueTextColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _completeTaskDialog(
      BuildContext context,
      TaskNotifier _notifier,
      TaskData data,
      WidgetRef ref,
      int id,
      double totalPoint) {
    return showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: const Text("タスクを完了しますか？"),
              actions: [
                CupertinoDialogAction(
                    child: Text('いいえ'),
                    isDestructiveAction: true,
                    onPressed: () {
                      context.router.pop();
                    }),
                CupertinoDialogAction(
                  child: const Text('はい'),
                  onPressed: () async {
                    await _notifier
                        .completeTask(data)
                        .then((value) => ref.refresh(taskListProvider(id)));
                    final _state = await ref.watch(objectivesNotifierProvider);
                    if (_state.archivementPoint == totalPoint) {
                      context.router.pop(true);
                    }
                    context.router.pop();
                  },
                )
              ],
            ));
  }

  Future<dynamic> _deleteTaskDialog(BuildContext context,
      TaskNotifier _notifier, TaskData data, WidgetRef ref, int id) {
    return showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: const Text("削除しますか？"),
              actions: [
                CupertinoDialogAction(
                    child: Text('いいえ'),
                    isDestructiveAction: true,
                    onPressed: () {
                      context.router.pop();
                    }),
                CupertinoDialogAction(
                  child: const Text('はい'),
                  onPressed: () async {
                    await _notifier
                        .deleteTask(data.id!)
                        .then((value) => ref.refresh(taskListProvider(id)));
                    context.router.pop();
                  },
                )
              ],
            ));
  }

  double f(double b, BuildContext context) {
    final height = MediaQuery.of(context).size.height; // 画面の高さを取得
    // 係数は適当に設定
    final y = math.sin(b * 2 * math.pi) * 5 + height * 0.015;
    return y;
  }

  double calculateTotalExPoint(List<TaskData> dataList) {
    double totalExPoint = 0;
    for (var data in dataList) {
      totalExPoint += data.exPoint ?? 0;
    }
    return totalExPoint;
  }
}
