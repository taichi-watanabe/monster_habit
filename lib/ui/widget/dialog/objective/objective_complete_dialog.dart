import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

class ObjectiveCompleteDialog extends HookConsumerWidget {
  ObjectiveCompleteDialog({Key? key, required this.totalPoint})
      : super(key: key);

  final double totalPoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _state = ref.watch(objectivesNotifierProvider);
    final _notifier = ref.watch(objectivesNotifierProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              constraints: const BoxConstraints(minWidth: 288, maxWidth: 380),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: SizedBox(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          height: 130,
                          child:
                              SvgPicture.asset('images/svg/celebration.svg')),
                      const SizedBox(
                        height: 20,
                      ),
                      const AppText(
                        text: 'おめでとうございます！',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const AppText(
                        text: 'タスクを全て完遂しました！',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        text: '目標を達成する',
                        onPressed: () async {
                          _notifier.setTotalPoint(totalPoint);
                          await _notifier.completeObjective();
                          context.router.pop(true);
                        },
                        backgroundColor: AppColor.blueTextColor,
                        height: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppButton(
                        text: '今はしない',
                        onPressed: () async {
                          context.router.pop(false);
                        },
                        backgroundColor: AppColor.gray04,
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_state.isLoading) FullScreenIndicator(),
        ],
      ),
    );
  }
}
