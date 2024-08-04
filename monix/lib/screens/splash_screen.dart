import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/admob_ads/reward_ads.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:network/category/provider/all_category_provider.dart';
import 'package:network/images/provider/all_images_provider.dart';
import 'package:network/ads/provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../admob_ads/interstitial_ads.dart';
import '../router/routes_name.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: SplashScreen(),
        state: state,
      );

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final InterstitialAds _interstitialAds = InterstitialAds();
  final RewardedAds _rewardedAds = RewardedAds();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getAdsData();

      getAllImages();

      getAllCategory(ref: ref);
      // _rewardedAds.createRewardAd(ref: ref,);
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

  void getAllCategory({required WidgetRef ref}) {
    ref.read(allCategoryDataProvider.notifier).allCategory(
      queryParams: {},
      isSearch: false,
    );
  }

  getAdsData() async {
    await ref.read(adsDataProvider.notifier).adsData();
    final isShowAd = ref.read(adsDataProvider.notifier).isShowAd;
    if (isShowAd != null && isShowAd) {
      final interAndroidSkipBtn =
          ref.read(adsDataProvider.notifier).interAndroidDeleteBtn;
      final downloadRewardAndroidBtn =
          ref.read(adsDataProvider.notifier).downloadImageRewardAndroidBtn;

      // if (interAndroidSkipBtn.isNotEmpty) {
      // _interstitialAds.createInterstitialAd(
      //     ref: ref, interAdId: interAndroidSkipBtn);
      // }
      if (Platform.isAndroid && downloadRewardAndroidBtn.isNotEmpty) {
        _rewardedAds.createRewardAd(
            ref: ref,
            rewardId: ref
                .read(adsDataProvider.notifier)
                .downloadImageRewardAndroidBtn);
      }
      if (Platform.isAndroid && interAndroidSkipBtn.isNotEmpty) {
        _interstitialAds.createInterstitialAd(
            ref: ref, interAdId: interAndroidSkipBtn);
      }
    }
    // ref.read(adsDataProvider.notifier).;
  }

  // Navigation to home screen
  void _navigation() async {
    Duration time = const Duration(seconds: 3);
    await Future.delayed(
      time,
      () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        // Save an boolean value to 'repeat' key.
        final isLoginStatus = await prefs.getBool('isLogin');
        print("statusLogin$isLoginStatus");
       
        if (isLoginStatus != null && isLoginStatus) {
          context.go(AppRoutesPath.dashboardScreen);
        } else {
          context.go(AppRoutesPath.onboardScreen);
        }
      },
    );
  }

  Future<void> getAllImages() async {
    // ref.read(allImagesDataProvider.notifier).page = 1;
    ref.read(allImagesDataProvider.notifier).isPagination = true;

    await ref.read(allImagesDataProvider.notifier).allImages(
        isSearch: false,
        searchText: '',
        type: StringManager.post,
        page: 1,
        limit: 10);
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
