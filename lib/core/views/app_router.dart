import 'package:auto_route/auto_route.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/budget_split.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: BudgetSplitPage, initial: true),
    AutoRoute(page: SettingsPage),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
