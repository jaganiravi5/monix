import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix_assets/monix_assets.dart';

import '../admob_ads/interstitial_ads.dart';
import '../admob_ads/native_ads.dart';
import '../router/routes_name.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: SplashScreen(),
        state: state,
      );

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final InterstitialAds _interstitialAds = InterstitialAds();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _interstitialAds.createInterstitialAd(ref: ref);
      // _nativeAds.loadNativeAds(ref: ref);
    });
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
        context.go(AppRoutesPath.onboardScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;

    return Scaffold(
      backgroundColor: color.bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            images.splashLogo.image(
              width: 200.w,
              height: 200.w,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 100.w,
            ),
            CustomProgressIndicator(),
            // showLoadingDialog(context, true),
            Text(
              StringManager.splashDesc,
              style: TextStyle(
                color: color.grey500,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 25.w,
            ),
          ],
        ),
      ),
    );
  }
}
