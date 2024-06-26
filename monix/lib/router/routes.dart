import 'package:go_router/go_router.dart';
import 'package:monix/monix.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/category/all_category_screen.dart';
import 'package:monix/screens/dashboard/dashboard_screen.dart';
import 'package:monix/screens/dashboard/idea_screen.dart';
import 'package:monix/screens/images/download_image_screen.dart';
import 'package:monix/screens/images/image_preview_screen.dart';
import 'package:monix/screens/images/images_list_screen.dart';
import 'package:monix/screens/monix_ai/monix_ai_screen.dart';
import 'package:monix/screens/onboard/onboard_screen.dart';
import 'package:monix/screens/saved/saved_screen.dart';

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
    pageBuilder: HomeScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.monixAiScreen,
    pageBuilder: MonixAiScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.searchScreen,
    pageBuilder: DashboardScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.savedScreen,
    pageBuilder: SavedScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.allCategoryScreen,
    pageBuilder: AllCategoryScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.imageListScreen,
    pageBuilder: ImageListScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.imagePreviewScreen,
    pageBuilder: ImagePreviewScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.ideaScreen,
    pageBuilder: IdeaScreen.builder,
  ),
  GoRoute(
    path: AppRoutesPath.downloadImageScreen,
    pageBuilder: DownloadImageScreen.builder,
  ),
];
