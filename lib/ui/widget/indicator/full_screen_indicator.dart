import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FullScreenIndicator extends HookConsumerWidget {
  const FullScreenIndicator({this.nullColor = false, Key? key})
      : super(key: key);
  final bool? nullColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: nullColor! ? null : const Color(0x50000000),
        ),
        const Align(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
