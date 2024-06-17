import 'package:flutter/material.dart';
import 'package:todoist_mvvm/core/routes.dart';
import 'package:todoist_mvvm/di.dart';

void main() async {
  await _initEverything();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'Frello Board',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

_initEverything() async {

  /// get it instances
  setupLocator();
}
