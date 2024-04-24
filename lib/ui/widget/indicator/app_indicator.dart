import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AppIndicator extends HookConsumerWidget {
  const AppIndicator(
      {this.backGroundColor = Colors.white,
      this.minHeight = 20,
      this.width,
      this.height,
      this.value,
      this.valueColor,
      required this.isCircular,
      this.radius,
      this.lineWidth,
      this.centerWidget,
      this.footerWidget,
      this.backgroundWidth,
      Key? key})
      : super(key: key);
  final bool isCircular;
  final Color? backGroundColor;
  final double? minHeight;
  final double? height;
  final double? width;
  final double? lineWidth;
  final double? value;
  final Color? valueColor;
  final double? radius;
  final Widget? centerWidget;
  final Widget? footerWidget;
  final double? backgroundWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      child: SizedBox(
        width: width,
        height: height,
        child: !isCircular
            ? LinearPercentIndicator(
                percent: value!,
                animation: true,
                animationDuration: 800,
                progressColor: valueColor,
                backgroundColor: backGroundColor,
                lineHeight: minHeight!,
                width: width,
                barRadius: const Radius.circular(10),
              )
            : CircularPercentIndicator(
                percent: value!,
                radius: radius!,
                animation: true,
                animationDuration: 800,
                progressColor: changeColor(value!, valueColor!),
                backgroundColor: backGroundColor ?? Colors.white,
                lineWidth: lineWidth ?? 0,
                center: centerWidget,
                footer: footerWidget,
                backgroundWidth: backgroundWidth ?? 0,
                circularStrokeCap: CircularStrokeCap.round,
              ),
      ),
    );
  }

  Color changeColor(double value, Color backGroundColor) {
    switch (value) {
      default:
        if (value <= 0.2) {
          return backGroundColor.withOpacity(0.1);
        } else if (value <= 0.4) {
          return backGroundColor.withOpacity(0.3);
        } else if (value <= 0.6) {
          return backGroundColor.withOpacity(0.5);
        } else if (value <= 0.8) {
          return backGroundColor.withOpacity(0.7);
        } else {
          return backGroundColor;
        }
    }
  }
}
