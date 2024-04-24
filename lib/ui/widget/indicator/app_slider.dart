import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';

class AppSlider extends HookConsumerWidget {
  const AppSlider(
      {this.onChanged,
      required this.value,
      this.valueColor,
      this.width,
      Key? key})
      : super(key: key);
  final double _min = 0;
  final double _max = 10;
  final int _divisions = 10;
  final double value;
  final double? width;
  final Color? valueColor;
  final Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 25,
      width: width,
      child: SliderTheme(
        data: const SliderThemeData(trackHeight: 2),
        child: Slider(
          min: _min,
          max: _max,
          value: value,
          divisions: _divisions,
          onChanged: onChanged,
          activeColor: AppColor.blueTextColor,
          inactiveColor: AppColor.appMainColor,
          label: '${value}',
        ),
      ),
    );
  }
}
