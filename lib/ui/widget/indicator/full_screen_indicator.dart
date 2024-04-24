import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FullScreenIndicator extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0x50000000),
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
