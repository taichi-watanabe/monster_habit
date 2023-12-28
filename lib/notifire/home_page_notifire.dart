import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageNotifire {
  late final WidgetRef _ref;

  HomePageNotifire(
      WidgetRef ref, TickerProvider tickerProvider, BuildContext context);

  //モンスターインスタ風UI表示
  List<String> monsterImages = [
    'images/Halloween-24.png',
    'images/Halloween-24.png',
    'images/Halloween-24.png',
    'images/Halloween-24.png',
    'images/Halloween-24.png',
    'images/Halloween-24.png',
    'images/Halloween-24.png',
    'images/Halloween-24.png',
  ];
}
