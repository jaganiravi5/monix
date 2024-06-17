import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/intro_slider%202/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:monix/admob_ads/native_ads.dart';
import 'package:monix/router/routes_name.dart';
import 'package:network/category/data/model/all_category_model.dart';

import '../../admob_ads/interstitial_ads.dart';
import '../../router/custom_page_transition.dart';

class OnboardScreen extends ConsumerStatefulWidget {
  OnboardScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: OnboardScreen(),
        state: state,
      );

  @override
  ConsumerState<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends ConsumerState<OnboardScreen> {
  final InterstitialAds _interstitialAds = InterstitialAds();
  final NativeAds _nativeAds = NativeAds();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // _interstitialAds.createInterstitialAd(ref: ref);
      _nativeAds.loadNativeAds(ref: ref);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).monixColors.bgColor,
      body: IntroSlider(
          onComplete: () {},
          onGetStartedClick: () => context.go(AppRoutesPath.dashboardScreen),
          onNextClick: () => context.go(AppRoutesPath.onboardScreen),
          onSkipClick: () {
            if (ref.read(interAdsProvider.notifier).state == null) {
              print('Warning: attempt to show interstitial before loaded.');
            } else {
              _interstitialAds.showInterstitialAd(
                ref: ref,
                onAdDismissedFullScreenContent: (p0) {
                  context.go(AppRoutesPath.dashboardScreen);
                },
                onAdFailedToShowFullScreenContent: (p0, p1) => context.go(AppRoutesPath.dashboardScreen),
              );
            }
            // if (intersAd == null) {
            //   print('Warning: attempt to show interstitial before loaded.');
            //   return;
            // } else {
            //   _interstitialAds.showInterstitialAd(interstitialAd: intersAd!);
            // }

            // context.go(AppRoutesPath.dashboardScreen);
          }),
    );
  }
}
