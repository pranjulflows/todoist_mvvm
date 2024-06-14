import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoist_mvvm/core/app_assets.dart';
import 'package:todoist_mvvm/core/routes.dart';
import 'package:todoist_mvvm/core/routes_path.dart';
import 'package:todoist_mvvm/di.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AppAssets.logo),
          ),
        ),
      ),
    );
  }

  moveToMain() {
    Future.delayed(const Duration(seconds: 2), () {
      locator<GoRouter>().go(PAGES.board.screenPath);
    });
  }
}
