import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';

import '../router/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const SplashScreen(),
        state: state,
      );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    _navigation();
  }

  // Navigation to home screen
  void _navigation() async {
    Duration time = const Duration(seconds: 3);
    await Future.delayed(
      time,
      () {
        context.go(AppRoutesPath.dashboardScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;

    return Scaffold(
      backgroundColor: color.black,
      body: Center(
        // Text - Adviser Copilot
        child: Text(
          "sjd",
          style: TextStyle(
            color: color.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}