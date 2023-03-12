import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_router.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const StadiumBorder(),
    );

    final appRouter = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Split the Bill',
      theme: ThemeData.from(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange))
          .copyWith(
        scaffoldBackgroundColor: const Color(0xffe0ddd0),
        elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blueGrey),
          backgroundColor: Color(0xffe0ddd0),
          titleTextStyle: TextStyle(color: Colors.black),
          elevation: 0,
        ),
      ),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
