import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/repository/preferences/preferences_repository.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:monster_habit/state/users/user_register_page_notifier.dart';

import 'package:monster_habit/ui/widget/color/app_color.dart';

import '../../../model/enum/loggedin_type.dart';

final _triggerNotifier = FutureProvider.family
    .autoDispose<LoggedInType, BuildContext>((ref, context) async {
  // Load token from the shared preferences.
  String? uuid = await ref.watch(preferencesRepositoryProvider).loadUuId();
  if (uuid == null) {
    LoggedInType _state = LoggedInType.notRegister;
    return _state;
  } else {
    final checkUuid =
        await ref.watch(userRegisterNotifierProvider.notifier).checkUser(uuid);
    if (checkUuid == true) {
      LoggedInType _state = LoggedInType.register;
      return _state;
    } else {
      LoggedInType _state = LoggedInType.notRegister;
      return _state;
    }
  }

  // Check if the app needs to be updated.
  /* final _versionCheck = ref.watch(versionCheckDatasouceProvider);
  final needUpdate = await _versionCheck.versionCheck();
  if (needUpdate) _state = LoggedInType.needUpdate;*/
});

@RoutePage()
class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<LoggedInType> trigerNotifier =
        ref.watch(_triggerNotifier(context));
    trigerNotifier.whenData((LoggedInType loggedInType) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        /*if (loggedInType == LoggedInType.needUpdate) {
          showUpdateDialog(true, context);
          return;
        }*/
        if (loggedInType == LoggedInType.register) {
          context.replaceRoute(const DashboardRoute());
        } else if (loggedInType == LoggedInType.notRegister) {
          context.replaceRoute(const UserRegisterRoute());
        }
      });
    });

    return Container(
      color: AppColor.appMainColor,
      padding: EdgeInsets.zero,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/svg/material-symbols_delete-outline.svg',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
