import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:monster_habit/widget/app_color.dart';
import 'package:speech_balloon/speech_balloon.dart';

@RoutePage()
class ObjectiveHistoryPage extends StatefulWidget {
  const ObjectiveHistoryPage({super.key});

  @override
  State<ObjectiveHistoryPage> createState() => _ObjectiveHistoryPageState();
}

class _ObjectiveHistoryPageState extends State<ObjectiveHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.widgetBackColor,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.only(top: 31, left: 18, bottom: 31),
                child: Text(
                  'ボタン',
                  style: TextStyle(
                      color: Color.fromARGB(255, 159, 158, 158),
                      fontSize: 16.0),
                ),
              ),
            ])),
            SliverFixedExtentList(
                itemExtent: 150,
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 10, bottom: 20, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '夏までに３キロ痩せる',
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 70.0,
                                    height: 70.0,
                                    child:
                                        Image.asset('images/Halloween-24.png'),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 20),
                                    child: SpeechBalloon(
                                      nipLocation: NipLocation.left,
                                      color: Colors.white,
                                      height: 35,
                                      width: 50,
                                      borderColor: AppColor.blueTextColor,
                                      borderWidth: 4,
                                      nipHeight: 12.0,
                                      borderRadius: 10,
                                      child: Center(child: Text('達成!')),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            child: DefaultTextStyle.merge(
                              style: TextStyle(fontSize: 11),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('達成日'),
                                        Text('タスク数'),
                                        Text('獲得ポイント'),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('2023/10/23'),
                                        Text('7個'),
                                        Text('94P'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, childCount: 2)),
          ],
        ));
  }
}
