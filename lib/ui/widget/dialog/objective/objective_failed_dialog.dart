import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

class ObjectiveFailedDialog extends HookConsumerWidget {
  const ObjectiveFailedDialog({Key? key}) : super(key: key);

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
                      Icon(
                        Icons.mood_bad,
                        size: 90,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const AppText(
                        text: 'この目標を諦めますか？',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                      const AppText(
                        text: 'よく考えましょう。まだまだやれることはあるはずです！',
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        text: '諦める',
                        onPressed: () async {
                          await _notifier.failedObjective();
                          _notifier.resetState();
                          context.router.pop(true);
                        },
                        backgroundColor: AppColor.blueTextColor,
                        height: 50,
                      ),
                      AppButton(
                        text: '考え直す',
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
