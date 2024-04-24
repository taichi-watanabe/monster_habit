import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';
import 'package:monster_habit/state/notifier/tasks/task_notifier.dart';
import 'package:monster_habit/state/tasks.dart';
import 'package:monster_habit/ui/form/app_form.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/ui/widget/indicator/app_slider.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class ObjectiveAddTaskPage extends HookConsumerWidget {
  ObjectiveAddTaskPage(
      {super.key,
      Key? keyrequired,
      this.objectiveId,
      this.id,
      this.fromEdit = false,
      this.task});

  final int? objectiveId;
  final int? id;
  final bool fromEdit;
  final TaskData? task;
  final _titleFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _notifier = ref.watch(taskNotifierProvider.notifier);
    final _state = ref.watch(taskNotifierProvider);
    var _titleFocueNode = useFocusNode();
    var _titleController =
        useTextEditingController(text: fromEdit ? task!.taskTitle : '');

    useFuture(useMemoized((() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _notifier.hasPoint(fromEdit ? task!.exPoint! : 0);
      });
      _titleFocueNode.addListener(
        () {
          if (!_titleFocueNode.hasFocus) {
            _titleFieldKey.currentState?.validate();
          }
        },
      );
    })));

    return GestureDetector(
      onTap: () {
        _titleFocueNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppText(
            text: "タスク設定",
            color: AppColor.mainTextColor,
            fontSize: 20,
          ),
          backgroundColor: AppColor.appMainColor,
          leading: TextButton(
              child: const Icon(Icons.leak_add),
              onPressed: () => context.router.pop()),
        ),
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 17, right: 17),
            child: Column(children: [
              SizedBox(
                  width: 190,
                  height: 140,
                  child: SvgPicture.asset('images/svg/development.svg')),
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(text: 'タスク名'),
                  const SizedBox(
                    height: 5,
                  ),
                  AppForm(
                    fieldKey: _titleFieldKey,
                    focusNode: _titleFocueNode,
                    fillColor: AppColor.appMainColor,
                    validationCallBack: (value) =>
                        _notifier.titleValidator(value),
                    hintText: '３ヶ月ランニング継続',
                    textInputType: TextInputType.text,
                    controller: _titleController,
                    maxLines: 1,
                    onChanged: (value) {
                      _notifier.setTaskTitle(value);
                      if (_titleFieldKey.currentState?.hasError == true) {
                        _titleFieldKey.currentState?.validate();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 42,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(text: '難易度'),
                  const SizedBox(
                    height: 15,
                  ),
                  AppSlider(
                    value: _state.exPoint,
                    onChanged: (value) {
                      _notifier.setExPoint(value);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (!_state.hasPoint)
                    const AppText(
                      text: '＊数値を設定してください',
                      color: AppColor.baseRed,
                    ),
                ],
              ),
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 33, left: 17, right: 17, bottom: 50),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                text: '保存する',
                height: 50,
                backgroundColor: !_state.checkTaskAddPageButton
                    ? AppColor.gray04
                    : AppColor.blueTextColor,
                textColor: !_state.checkTaskAddPageButton ? null : Colors.white,
                onPressed: () async {
                  if (fromEdit == true) {
                    if (!_state.checkTaskAddPageButton) {
                      return null;
                    }
                    await _notifier.editTask(task!.id!);
                    context.router.pop();
                  } else {
                    if (!_state.checkTaskAddPageButton) {
                      return null;
                    }
                    await _notifier.putTask(objectiveId!);
                    context.router.pop();
                  }
                },
              ),
            ),
          ),
          if (_state.isLoading) FullScreenIndicator()
        ]),
      ),
    );
  }
}
