import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/ui/widget/color/app_color.dart';
import 'package:monster_habit/ui/widget/text/app_text.dart';

class ObjectiveRegisterDialog extends HookConsumerWidget {
  const ObjectiveRegisterDialog({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              constraints: const BoxConstraints(minWidth: 288, maxWidth: 380),
              decoration: BoxDecoration(
                color: AppColor.appMainColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: const BoxDecoration(),
                child: AppText(
                  text: title,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
