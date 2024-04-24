import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monster_habit/dashboard_page.dart';
import 'package:monster_habit/model/task_data.dart';
import 'package:monster_habit/ui/page/capture/capture_book_page.dart';
import 'package:monster_habit/ui/page/home/home_page.dart';
import 'package:monster_habit/ui/page/objectives/objective_add_page.dart';
import 'package:monster_habit/ui/page/objectives/objective_add_task_page.dart';
import 'package:monster_habit/ui/page/objectives/objective_history_page.dart';
import 'package:monster_habit/ui/page/objectives/tab/objective_tab_page.dart';
import 'package:monster_habit/ui/page/objectives/objective_page.dart';
import 'package:monster_habit/ui/page/objectives/objective_complete_page.dart';
import 'package:monster_habit/ui/page/objectives/objective_edit_page.dart';
import 'package:monster_habit/ui/page/objectives/item/monster_coming_page.dart';
import 'package:monster_habit/ui/page/account/account_page.dart';
import 'package:monster_habit/ui/page/launch/splash_page.dart';
import 'package:monster_habit/model/objectives_data.dart';
import 'package:monster_habit/ui/page/account/chat_page.dart';
import 'package:monster_habit/ui/page/login/user_register_page.dart';
part 'package:monster_habit/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: UserRegisterRoute.page),
        AutoRoute(page: ObjectAddRoute.page),
        AutoRoute(page: ObjectiveAddTaskRoute.page),
        AutoRoute(page: ObjectiveEditRoute.page),
        AutoRoute(page: ObjectRoute.page),
        AutoRoute(page: MonsterComingRoute.page),
        AutoRoute(page: ObjectiveCompleteRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(
          path: '/',
          page: DashboardRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(page: ObjectRouterRoute.page, children: [
              AutoRoute(page: ObjectiveTabRoute.page, initial: true),
            ]),
            AutoRoute(page: ObjectiveHistoryRoute.page),
            AutoRoute(
              page: CaptureBookRoute.page,
            ),
            AutoRoute(
              page: AccountRoute.page,
            ),
          ],
        ),
      ];
}
