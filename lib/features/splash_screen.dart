import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todoist_mvvm/core/app_assets.dart';
import 'package:todoist_mvvm/core/routes_path.dart';
import 'package:todoist_mvvm/di.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    moveToHome();
    super.initState();
  }
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

  moveToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      locator<GoRouter>().go(PAGES.board.screenPath);
    });
  }
}
