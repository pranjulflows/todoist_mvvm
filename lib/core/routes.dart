import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoist_mvvm/core/routes_path.dart';
import 'package:todoist_mvvm/features/dashboard/kanban_board_screen.dart';
import 'package:todoist_mvvm/features/splash_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  /// The route configuration.
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      GoRoute(
        path: PAGES.home.screenPath,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: PAGES.board.screenPath,
        name: PAGES.board.screenName,
        builder: (BuildContext context, GoRouterState state) {
          return const KanbanBoardScreen();
        },
      ),
    ],
  );
}
