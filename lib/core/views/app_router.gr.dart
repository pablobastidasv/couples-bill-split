// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    BudgetSplitRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BudgetSplitPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          BudgetSplitRoute.name,
          path: '/',
        ),
        RouteConfig(
          SettingsRoute.name,
          path: '/settings-page',
        ),
      ];
}

/// generated route for
/// [BudgetSplitPage]
class BudgetSplitRoute extends PageRouteInfo<void> {
  const BudgetSplitRoute()
      : super(
          BudgetSplitRoute.name,
          path: '/',
        );

  static const String name = 'BudgetSplitRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings-page',
        );

  static const String name = 'SettingsRoute';
}
