// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    CaptureBookRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CaptureBookPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    ObjectiveAddTaskRoute.name: (routeData) {
      final args = routeData.argsAs<ObjectiveAddTaskRouteArgs>(
          orElse: () => const ObjectiveAddTaskRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ObjectiveAddTaskPage(
          key: args.key,
          keyrequired: args.keyrequired,
          objectiveId: args.objectiveId,
          id: args.id,
          fromEdit: args.fromEdit,
          task: args.task,
        ),
      );
    },
    ObjectRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ObjectPage(),
      );
    },
    ObjectiveEditRoute.name: (routeData) {
      final args = routeData.argsAs<ObjectiveEditRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ObjectiveEditPage(
          key: args.key,
          objective: args.objective,
          monsterUrl: args.monsterUrl,
        ),
      );
    },
    ObjectAddRoute.name: (routeData) {
      final args = routeData.argsAs<ObjectAddRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ObjectAddPage(
          key: args.key,
          monsterUrl: args.monsterUrl,
          id: args.id,
        ),
      );
    },
    ObjectiveCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<ObjectiveCompleteRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ObjectiveCompletePage(
          key: args.key,
          point: args.point,
          monsterUrl: args.monsterUrl,
          id: args.id,
        ),
      );
    },
    ObjectRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ObjectRouterPage(),
      );
    },
    ObjectiveTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ObjectiveTabPage(),
      );
    },
    MonsterComingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MonsterComingPage(),
      );
    },
    ObjectiveHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ObjectiveHistoryPage(),
      );
    },
    UserRegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserRegisterPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChatPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CaptureBookPage]
class CaptureBookRoute extends PageRouteInfo<void> {
  const CaptureBookRoute({List<PageRouteInfo>? children})
      : super(
          CaptureBookRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaptureBookRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ObjectiveAddTaskPage]
class ObjectiveAddTaskRoute extends PageRouteInfo<ObjectiveAddTaskRouteArgs> {
  ObjectiveAddTaskRoute({
    Key? key,
    Key? keyrequired,
    int? objectiveId,
    int? id,
    bool fromEdit = false,
    TaskData? task,
    List<PageRouteInfo>? children,
  }) : super(
          ObjectiveAddTaskRoute.name,
          args: ObjectiveAddTaskRouteArgs(
            key: key,
            keyrequired: keyrequired,
            objectiveId: objectiveId,
            id: id,
            fromEdit: fromEdit,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'ObjectiveAddTaskRoute';

  static const PageInfo<ObjectiveAddTaskRouteArgs> page =
      PageInfo<ObjectiveAddTaskRouteArgs>(name);
}

class ObjectiveAddTaskRouteArgs {
  const ObjectiveAddTaskRouteArgs({
    this.key,
    this.keyrequired,
    this.objectiveId,
    this.id,
    this.fromEdit = false,
    this.task,
  });

  final Key? key;

  final Key? keyrequired;

  final int? objectiveId;

  final int? id;

  final bool fromEdit;

  final TaskData? task;

  @override
  String toString() {
    return 'ObjectiveAddTaskRouteArgs{key: $key, keyrequired: $keyrequired, objectiveId: $objectiveId, id: $id, fromEdit: $fromEdit, task: $task}';
  }
}

/// generated route for
/// [ObjectPage]
class ObjectRoute extends PageRouteInfo<void> {
  const ObjectRoute({List<PageRouteInfo>? children})
      : super(
          ObjectRoute.name,
          initialChildren: children,
        );

  static const String name = 'ObjectRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ObjectiveEditPage]
class ObjectiveEditRoute extends PageRouteInfo<ObjectiveEditRouteArgs> {
  ObjectiveEditRoute({
    Key? key,
    required ObjectivesData objective,
    required String monsterUrl,
    List<PageRouteInfo>? children,
  }) : super(
          ObjectiveEditRoute.name,
          args: ObjectiveEditRouteArgs(
            key: key,
            objective: objective,
            monsterUrl: monsterUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'ObjectiveEditRoute';

  static const PageInfo<ObjectiveEditRouteArgs> page =
      PageInfo<ObjectiveEditRouteArgs>(name);
}

class ObjectiveEditRouteArgs {
  const ObjectiveEditRouteArgs({
    this.key,
    required this.objective,
    required this.monsterUrl,
  });

  final Key? key;

  final ObjectivesData objective;

  final String monsterUrl;

  @override
  String toString() {
    return 'ObjectiveEditRouteArgs{key: $key, objective: $objective, monsterUrl: $monsterUrl}';
  }
}

/// generated route for
/// [ObjectAddPage]
class ObjectAddRoute extends PageRouteInfo<ObjectAddRouteArgs> {
  ObjectAddRoute({
    Key? key,
    required String monsterUrl,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          ObjectAddRoute.name,
          args: ObjectAddRouteArgs(
            key: key,
            monsterUrl: monsterUrl,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ObjectAddRoute';

  static const PageInfo<ObjectAddRouteArgs> page =
      PageInfo<ObjectAddRouteArgs>(name);
}

class ObjectAddRouteArgs {
  const ObjectAddRouteArgs({
    this.key,
    required this.monsterUrl,
    required this.id,
  });

  final Key? key;

  final String monsterUrl;

  final int id;

  @override
  String toString() {
    return 'ObjectAddRouteArgs{key: $key, monsterUrl: $monsterUrl, id: $id}';
  }
}

/// generated route for
/// [ObjectiveCompletePage]
class ObjectiveCompleteRoute extends PageRouteInfo<ObjectiveCompleteRouteArgs> {
  ObjectiveCompleteRoute({
    Key? key,
    required int point,
    required String monsterUrl,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          ObjectiveCompleteRoute.name,
          args: ObjectiveCompleteRouteArgs(
            key: key,
            point: point,
            monsterUrl: monsterUrl,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ObjectiveCompleteRoute';

  static const PageInfo<ObjectiveCompleteRouteArgs> page =
      PageInfo<ObjectiveCompleteRouteArgs>(name);
}

class ObjectiveCompleteRouteArgs {
  const ObjectiveCompleteRouteArgs({
    this.key,
    required this.point,
    required this.monsterUrl,
    required this.id,
  });

  final Key? key;

  final int point;

  final String monsterUrl;

  final int id;

  @override
  String toString() {
    return 'ObjectiveCompleteRouteArgs{key: $key, point: $point, monsterUrl: $monsterUrl, id: $id}';
  }
}

/// generated route for
/// [ObjectRouterPage]
class ObjectRouterRoute extends PageRouteInfo<void> {
  const ObjectRouterRoute({List<PageRouteInfo>? children})
      : super(
          ObjectRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ObjectRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ObjectiveTabPage]
class ObjectiveTabRoute extends PageRouteInfo<void> {
  const ObjectiveTabRoute({List<PageRouteInfo>? children})
      : super(
          ObjectiveTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ObjectiveTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MonsterComingPage]
class MonsterComingRoute extends PageRouteInfo<void> {
  const MonsterComingRoute({List<PageRouteInfo>? children})
      : super(
          MonsterComingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MonsterComingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ObjectiveHistoryPage]
class ObjectiveHistoryRoute extends PageRouteInfo<void> {
  const ObjectiveHistoryRoute({List<PageRouteInfo>? children})
      : super(
          ObjectiveHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ObjectiveHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserRegisterPage]
class UserRegisterRoute extends PageRouteInfo<void> {
  const UserRegisterRoute({List<PageRouteInfo>? children})
      : super(
          UserRegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountPage]
class AccountRoute extends PageRouteInfo<void> {
  const AccountRoute({List<PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ChatPage]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
