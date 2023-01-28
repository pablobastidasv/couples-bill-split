import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/budget_calculator.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/settings.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: BudgetCalculatorPage, initial: true),
    AutoRoute(page: SettingsPage),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter{}
