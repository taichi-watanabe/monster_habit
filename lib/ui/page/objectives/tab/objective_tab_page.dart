import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/ui/page/objectives/objective_history_page.dart';
import 'package:monster_habit/ui/page/objectives/objective_page.dart';

@RoutePage()
class ObjectRouterPage extends AutoRouter {
  const ObjectRouterPage({super.key});
}

@RoutePage()
class ObjectiveTabPage extends HookConsumerWidget {
  const ObjectiveTabPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: '目標一覧',
                ),
                Tab(text: '目標履歴'),
              ],
              labelColor: Colors.black,
              indicatorColor: Colors.green,
            ),
            backgroundColor: const Color.fromARGB(255, 193, 228, 233),
          ),
          body: const TabBarView(
            children: <Widget>[
              ObjectPage(),
              ObjectiveHistoryPage(),
            ],
          ),
        ),
      ),
    );
  }
}
