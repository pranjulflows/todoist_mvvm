import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todoist_mvvm/core/routes.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<GoRouter>(AppRouter.router);
}
