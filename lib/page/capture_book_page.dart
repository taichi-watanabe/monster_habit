import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CaptureBookPage extends StatefulWidget {
  const CaptureBookPage({super.key});

  @override
  State<CaptureBookPage> createState() => _CaptureBookPageState();
}

class _CaptureBookPageState extends State<CaptureBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('捕獲図鑑'),
      ),
    );
  }
}
