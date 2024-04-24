import 'package:flutter/material.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:monster_habit/state/notifier/stamina/stamina_notifier.dart';

Widget heartContainer(WidgetRef ref) {
  final state = ref.watch(staminaNotifierProvider);
  return Column(children: [
    RatingBar.builder(
        initialRating: state.currentStamina.toDouble(),
        itemSize: 30,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 3,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, index) => Image.asset(
              'images/heart.png',
              color: AppColor.statusColor,
            ),
        ignoreGestures: true,
        onRatingUpdate: (rating) {
          rating = state.currentStamina.toDouble();
        },
        unratedColor: AppColor.gray03),
    const SizedBox(
      height: 5,
    ),
    Text(
      DateFormat.Hms().format(state.time!),
    ),
  ]);
}
