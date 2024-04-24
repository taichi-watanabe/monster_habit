import 'package:flutter/material.dart';

Future showCustomDialog(BuildContext context, Widget widget) {
  return showDialog(
    barrierDismissible: false,
    useSafeArea: false,
    context: context,
    builder: (context) {
      return widget;
    },
  );
}
