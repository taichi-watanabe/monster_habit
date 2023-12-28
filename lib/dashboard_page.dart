import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monster_habit/router/app_router.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ObjectiveTabRoute(),
        CaptureBookRoute(),
        SettingRoute()
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'ホーム',
                icon: Icon(Icons.home),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                label: '目標一覧',
                icon: Icon(Icons.home),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                label: '捕獲図鑑',
                icon: Icon(Icons.home),
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                label: '設定',
                icon: Icon(Icons.home),
                backgroundColor: Colors.black),
          ],
        );
      },
    );
  }
}             

  /*
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        // ここに各タブ画面のルートを追加する
        HomeRoute(),
        ObjectRoute(),
        CaptureBookRoute(),
        SettingRoute(),
      ],
      builder: (context, child) {
        // タブが切り替わると発火します
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'ホーム',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle),
                label: '目標一覧',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle),
                label: '捕獲図鑑',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle),
                label: '設定',
              ),
            ],
            onDestinationSelected: tabsRouter.setActiveIndex,
          ),
        );
      },
    );
  }
}
*/
