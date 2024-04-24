import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class AppButton extends HookConsumerWidget {
  const AppButton(
      {required this.text,
      required this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.width,
      this.height,
      this.fontSize,
      this.icon,
      Key? key})
      : super(key: key);
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: width == null ? double.infinity : width!,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                backgroundColor == null ? Colors.white : backgroundColor!,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (text != '')
                Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: fontSize == null ? 20 : fontSize!,
                      fontWeight: FontWeight.bold),
                ),
              if (icon != null) Icon(icon),
            ],
          )),
    );
  }
}
