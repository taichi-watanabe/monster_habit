import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:monster_habit/router/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://iaoxrrbvzwtngohzkgym.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlhb3hycmJ2end0bmdvaHprZ3ltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDYzMjc1MzIsImV4cCI6MjAyMTkwMzUzMn0.VRy6HykeLHec7KW3Fs5xiWxOK5bnd2ufGEnP2F-FliM',
  );
  await initializeDateFormatting('ja_JP').then(
    (_) {
      runApp(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    },
  );
}

final _appRouter = AppRouter();

class MyApp extends HookConsumerWidget with WidgetsBindingObserver {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      routerConfig: _appRouter.config(),
      title: 'Monster habit',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
