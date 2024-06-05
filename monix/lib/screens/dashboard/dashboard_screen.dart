
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: const DashboardScreen(),
        state: state,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).monixColors.bgColor,
      body: SafeArea(child: Text("Helo",style: TextStyle(fontSize: 22,color: Theme.of(context).monixColors.white),)),
    );
  }
}
