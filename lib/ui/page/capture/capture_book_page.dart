import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/model/capture_data.dart';
import 'package:monster_habit/state/capture_books.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

@RoutePage()
class CaptureBookPage extends HookConsumerWidget {
  const CaptureBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CaptureData> capture;

    return ref.watch(captureBooksListProvider).when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stackTrace) => const Center(
              child: Text('エラーが発生しました'),
            ),
        data: (data) {
          if (data.isEmpty) {
            return _emptyPage();
          }

          capture = data;
          var _captureData = capture.toList(growable: false);

          return Scaffold(
            appBar: AppBar(
              title: const AppText(
                text: "捕獲図鑑",
                color: AppColor.mainTextColor,
                fontSize: 20,
              ),
              backgroundColor: AppColor.appMainColor,
              automaticallyImplyLeading: false,
            ),
            body: WillPopScope(
              onWillPop: () async => false,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 20,
                    title: AppText(
                      text: '見つけた数： ${_captureData.length.toString()}',
                      color: AppColor.greyText,
                      fontSize: 14,
                    ),
                    backgroundColor: Colors.white,
                    floating: true,
                  ),
                  SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.25),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        var data = _captureData[index];
                        return captureTile(data);
                      },
                      childCount: _captureData.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget captureTile(CaptureData data) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Container(
          decoration: BoxDecoration(
              color: AppColor.appMainColor,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.endAt!,
                style: TextStyle(fontSize: 10),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: 60,
                height: 60,
                child: Image.asset(data.monsterUrl!),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(data.name!),
            ],
          )),
    );
  }

  Widget _emptyPage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        children: [
          SizedBox(height: 40),
          AppText(
            text: '現在、目標履歴はありません',
            fontSize: 16,
          )
        ],
      ),
    );
  }
}
