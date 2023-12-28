import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monster_habit/notifire/home_page_notifire.dart';
import 'package:monster_habit/widget/app_color.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late HomePageNotifire _vm;

  @override
  void initState() {
    super.initState();
    _vm = HomePageNotifire(ref, this, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ホーム',
          style: TextStyle(color: AppColor.mainTextColor),
        ),
        backgroundColor: AppColor.appMainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePageTop(vm: _vm),
            StatusWidget(),
            const SizedBox(
              height: 21,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 17, left: 17),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.widgetBackColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, left: 17, right: 17, bottom: 37),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Graph',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColor.blueTextColor),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: double.infinity,
                        height: 130,
                        decoration: BoxDecoration(
                            color: AppColor.appMainColor,
                            borderRadius: BorderRadius.circular(10)),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 17, left: 17),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.widgetBackColor,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 12, left: 17, right: 17, bottom: 37),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Status',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blueTextColor),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          color: AppColor.appMainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 6),
                            child: Text(
                              'プロフィール',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Center(
                            child: Column(
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    fixedSize: const Size(70, 70),
                                    shape: const CircleBorder(),
                                  ),
                                  onPressed: () {},
                                  child: Text('画像'),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  '勇者',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                          color: AppColor.appMainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10, top: 6),
                            child: Text(
                              'スタミナ',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(
                            height: 27,
                          ),
                          Center(
                            child: RatingBar(
                              initialRating: 3,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 3,
                              itemSize: 30,
                              ratingWidget: RatingWidget(
                                full: Image.asset(
                                  'images/heart.png',
                                  color: AppColor.statusColor,
                                ),
                                half: Image.asset('images/heart_half.png',
                                    color: AppColor.statusColor),
                                empty: Image.asset('images/heart_border.png',
                                    color: AppColor.statusColor),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {
                                //print(rating);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                    color: AppColor.appMainColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 6, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'レベル',
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 33),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: const Size(70, 70),
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    '999',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: AppColor.blueTextColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Lvl',
                                    style: TextStyle(
                                        fontSize: 10, color: AppColor.greyText),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '次のレベルまであと... 99/100 P',
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  child: SizedBox(
                                    width: 145,
                                    height: 16,
                                    child: LinearProgressIndicator(
                                      value: 0.5,
                                      valueColor: AlwaysStoppedAnimation(
                                          AppColor.statusColor),
                                      backgroundColor: Colors.grey,
                                      minHeight: 20,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageTop extends StatelessWidget {
  const HomePageTop({
    super.key,
    required HomePageNotifire vm,
  }) : _vm = vm;

  final HomePageNotifire _vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            CircularPercentIndicator(
              radius: 42.0,
              lineWidth: 3.0,
              center: const Icon(
                Icons.abc,
              ),
              percent: 0,
              backgroundColor: Colors.white,
              footer: const Text(
                '新規追加',
                style: TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(width: 13), // 余白を追加
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _vm.monsterImages.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 42.0,
                      lineWidth: 3.0,
                      percent: 0.5,
                      center: Image.asset(
                        _vm.monsterImages[index],
                        width: 65,
                        height: 65,
                      ),
                      progressColor: AppColor.statusColor,
                      backgroundColor: AppColor.appMainColor,
                      backgroundWidth: 3,
                      animation: true,
                      footer: const Text(
                        '新規追加',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
