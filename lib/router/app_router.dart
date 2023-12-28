import 'package:auto_route/auto_route.dart';
import 'package:monster_habit/dashboard_page.dart';
import 'package:monster_habit/page/capture_book_page.dart';
import 'package:monster_habit/page/home_page.dart';
import 'package:monster_habit/page/objective_add_page.dart';
import 'package:monster_habit/page/objective_add_task_page.dart';
import 'package:monster_habit/page/objective_history_page.dart';
import 'package:monster_habit/page/tab/objective_tab_page.dart';
import 'package:monster_habit/page/objective_page.dart';
import 'package:monster_habit/page/setting_page.dart';
part 'package:monster_habit/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: DashboardRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(page: ObjectRouterRoute.page, children: [
              AutoRoute(page: ObjectiveTabRoute.page, initial: true),
              AutoRoute(page: ObjectAddRouterRoute.page, children: [
                AutoRoute(page: ObjectAddRoute.page, initial: true),
                AutoRoute(page: ObjectAddTaskRoute.page)
              ])
            ]),
            AutoRoute(page: ObjectiveHistoryRoute.page),
            AutoRoute(
              page: CaptureBookRoute.page,
            ),
            AutoRoute(
              page: SettingRoute.page,
            ),
            AutoRoute(page: ObjectRoute.page)
          ],
        ),
      ];
}
