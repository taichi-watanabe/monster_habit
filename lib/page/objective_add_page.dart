import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/widget/app_color.dart';

@RoutePage()
class ObjectAddRouterPage extends AutoRouter {
  const ObjectAddRouterPage({super.key});
}

@RoutePage()
class ObjectAddPage extends StatefulWidget {
  const ObjectAddPage({super.key});

  @override
  State<ObjectAddPage> createState() => _ObjectAddPageState();
}

class _ObjectAddPageState extends State<ObjectAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            '目標追加',
            style: TextStyle(color: AppColor.mainTextColor),
          ),
          backgroundColor: AppColor.appMainColor,
          leading: TextButton(
              child: Icon(Icons.leak_add),
              onPressed: () => context.router.pop())),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.widgetBackColor,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 13, left: 6, right: 6, bottom: 6),
            child: Column(
              children: [
                Container(
                  height: 166,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.appMainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 90.0,
                        height: 90.0,
                        child: Image.asset('images/Halloween-24.png'),
                      ),
                      const Text(
                        '仲間になるまで残り....',
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: SizedBox(
                              width: 200,
                              height: 12,
                              child: LinearProgressIndicator(
                                value: 0.5,
                                valueColor: AlwaysStoppedAnimation(
                                    AppColor.statusColor),
                                backgroundColor: Colors.white,
                                minHeight: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '0/100',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
      ),
      /*ElevatedButton(
        onPressed: () {
      context.router.push(const ObjectAddTaskRoute());
        },
        child: const Text('タスク追加へ'),
      ),*/
    );
  }
}
