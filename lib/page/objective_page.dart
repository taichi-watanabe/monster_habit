import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/widget/app_color.dart';

@RoutePage()
class ObjectPage extends StatefulWidget {
  const ObjectPage({super.key});

  @override
  State<ObjectPage> createState() => _ObjectPageState();
}

class _ObjectPageState extends State<ObjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/objective_image.png'),
            const SizedBox(
              height: 30,
            ),
            const Text('捕獲中...'),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    color: AppColor.appMainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 17,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image:
                                        AssetImage("images/Halloween-24.png"))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('夏までに３キロ痩せる'),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: SizedBox(
                                      width: 137,
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
                                    width: 5,
                                  ),
                                  Text('0%')
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const ObjectAddRouterRoute());
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColor.blueTextColor,
      ),
    );
  }
}
