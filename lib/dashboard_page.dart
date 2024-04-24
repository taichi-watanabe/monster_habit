// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:monster_habit/state/notifier/objectives/objectives_notifier.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:monster_habit/ui/widget/dialog/custom_dialog.dart';
import 'package:monster_habit/ui/widget/dialog/objective/objective_register_confirm.dart';
import 'package:monster_habit/ui/widget/indicator/full_screen_indicator.dart';

@RoutePage()
class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _state = ref.watch(objectivesNotifierProvider);
    final _notifier = ref.watch(objectivesNotifierProvider.notifier);

    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ObjectiveTabRoute(),
        CaptureBookRoute(),
        AccountRoute(),
      ],
      transitionBuilder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
            backgroundColor: AppColor.appMainColor,
            body: Stack(children: [
              FadeTransition(
                opacity: animation,
                child: child,
              ),
              if (_state.isLoading) FullScreenIndicator(),
            ]),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await showCustomDialog(
                  context,
                  const ObjectiveRegisterConfirm(),
                ).then((result) {
                  if (result == false) {
                    return;
                  } else {
                    context.router.push(
                      const MonsterComingRoute(),
                    );
                  }
                });
              },
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.black.withOpacity(0.5),
              ),
              backgroundColor: AppColor.blueTextColor,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              splashColor: AppColor.blueTextColor,
              inactiveColor: Colors.black.withOpacity(0.5),
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.defaultEdge,
              leftCornerRadius: 10,
              iconSize: 25,
              rightCornerRadius: 10,
              elevation: 2,
              backgroundColor: AppColor.appMainColor,
              activeIndex: tabsRouter.activeIndex,
              icons: const [
                CupertinoIcons.home,
                CupertinoIcons.creditcard,
                CupertinoIcons.money_dollar,
                CupertinoIcons.person,
              ],
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
            ));
      },
    );
  }
}
