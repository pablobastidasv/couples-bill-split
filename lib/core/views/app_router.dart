import 'package:auto_route/auto_route.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/budget_split.dart';
import 'package:couple_budget_calculator/budget/calculator/views/pages/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(page: BudgetSplitRoute.page, initial: true),
        AutoRoute(page: SettingsRoute.page),
      ];
}

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
