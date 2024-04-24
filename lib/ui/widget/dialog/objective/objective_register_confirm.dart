import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:monster_habit/state/notifier/stamina/stamina_notifier.dart';
import 'package:monster_habit/ui/page/home/item/heart_container.dart';
import 'package:monster_habit/ui/widget/button/app_button.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

class ObjectiveRegisterConfirm extends HookConsumerWidget {
  const ObjectiveRegisterConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _staminaState = ref.watch(staminaNotifierProvider);
    final _staminaNotifier = ref.watch(staminaNotifierProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context, false);
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
                          child: SvgPicture.asset('images/svg/mobile-app.svg')),
                      const SizedBox(
                        height: 20,
                      ),
                      _staminaState.currentStamina == 0
                          ? const AppText(
                              text: 'スタミナが足りません',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            )
                          : const AppText(
                              text: 'スタミナを消費して目標を登録しますか？',
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                      heartContainer(ref),
                      const SizedBox(
                        height: 20,
                      ),
                      AppButton(
                        text: '目標作成に進む',
                        onPressed: () async {
                          if (_staminaState.currentStamina == 0) {
                            return;
                          }
                          _staminaNotifier.startTimer();
                          await context.router.pop();
                        },
                        backgroundColor: _staminaState.currentStamina == 0
                            ? AppColor.gray04
                            : AppColor.blueTextColor,
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
