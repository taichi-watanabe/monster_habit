import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';

@RoutePage()
class ObjectAddTaskPage extends StatefulWidget {
  const ObjectAddTaskPage({super.key});

  @override
  State<ObjectAddTaskPage> createState() => _ObjectAddTaskPageState();
}

class _ObjectAddTaskPageState extends State<ObjectAddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク追加'),
      ),
    );
  }
}
