import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/intro_slider%202/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';

import '../../router/custom_page_transition.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const OnboardScreen(),
        state: state,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).monixColors.bgColor,
      body:
      IntroSlider(
        onComplete: () {},
        onGetStartedClick: () => context.go(AppRoutesPath.dashboardScreen),
        onNextClick: () => context.go(AppRoutesPath.dashboardScreen),
        onSkipClick: () => context.go(AppRoutesPath.dashboardScreen),
      ),
    );
  }
}
