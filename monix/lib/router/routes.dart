import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/dashboard/dashboard_screen.dart';
import 'package:monix/screens/onboard/onboard_screen.dart';

import '../screens/splash_screen.dart';

final routes = [
  GoRoute(
    path: AppRoutesPath.splashScreen,
    pageBuilder: SplashScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.onboardScreen,
    pageBuilder: OnboardScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.dashboardScreen,
    pageBuilder: DashboardScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.homeScreen,
    pageBuilder: DashboardScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.monixAiScreen,
    pageBuilder: DashboardScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.searchScreen,
    pageBuilder: DashboardScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.savedScreen,
    pageBuilder: DashboardScreen.builder,
  ),
];
