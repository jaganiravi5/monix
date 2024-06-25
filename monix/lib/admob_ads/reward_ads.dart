import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:network/network.dart';

import 'ad_helper.dart';

class RewardedAds {
  void createRewardAd({required WidgetRef ref}) {
    RewardedAd.load(
      adUnitId: AdHelper.rewardAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('$ad RewardedAdsLoaded');
          ref.read(rewardAdsProvider.notifier).state = ad;
          // _numInterstitialLoadAttempts = 0;
          ref.read(rewardAdsProvider.notifier).state?.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error.');
          // _numInterstitialLoadAttempts += 1;
          ref.read(rewardAdsProvider.notifier).state = null;
          // if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
          //   _createInterstitialAd();
          // }
        },
      ),
    );
  }

  void showRewardedAd({
    required WidgetRef ref,
    required BuildContext context,
    required Function(RewardedAd) onAdDismissedFullScreen,
    required Function(RewardedAd, AdError) onAdFailedToShowFullScreen,
  }) {
    if (ref.watch(rewardAdsProvider.notifier).state == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    ref.read(rewardAdsProvider.notifier).state?.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');

        ad.dispose();
        onAdDismissedFullScreen(ad);
        createRewardAd(ref: ref);
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        onAdFailedToShowFullScreen(ad, error);
        createRewardAd(ref: ref);
      },
    );
    ref.read(rewardAdsProvider.notifier).state?.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      // setState(() {
      //   life += 1;
      // });
    });
    ref.read(rewardAdsProvider.notifier).state = null;
  }
}

class RewardAdScreen extends StatefulWidget {
  const RewardAdScreen({
    super.key,
  });

  @override
  State<RewardAdScreen> createState() => _RewardAdScreenState();
}

class _RewardAdScreenState extends State<RewardAdScreen> {
  @override
  // InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  int maxFailedLoadAttempts = 5;
  int life = 0;
  int _numInterstitialLoadAttempts = 0;

  // void _createInterstitialAd() {
  // RewardedAd.load(
  //   adUnitId: AdHelper.rewardAdUnitId,
  //   request: AdRequest(),
  //   rewardedAdLoadCallback: RewardedAdLoadCallback(
  //     onAdLoaded: (RewardedAd ad) {
  //       print('$ad loaded');
  //       _rewardedAd = ad;
  //       _numInterstitialLoadAttempts = 0;
  //       _rewardedAd!.setImmersiveMode(true);
  //     },
  //     onAdFailedToLoad: (LoadAdError error) {
  //       print('InterstitialAd failed to load: $error.');
  //       _numInterstitialLoadAttempts += 1;
  //       _rewardedAd = null;
  //       if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
  //         _createInterstitialAd();
  //       }
  //     },
  //   ),
  // );
  // }

  @override
  void initState() {
    super.initState();
    // _createInterstitialAd();
  }

  // void _showInterstitialAd() {
  // if (_rewardedAd == null) {
  //   print('Warning: attempt to show interstitial before loaded.');
  //   return;
  // }
  // _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
  //   onAdShowedFullScreenContent: (RewardedAd ad) => print('ad onAdShowedFullScreenContent.'),
  //   onAdDismissedFullScreenContent: (RewardedAd ad) {
  //     print('$ad onAdDismissedFullScreenContent.');
  //     ad.dispose();
  //     _createInterstitialAd();
  //   },
  //   onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
  //     print('$ad onAdFailedToShowFullScreenContent: $error');
  //     ad.dispose();
  //     _createInterstitialAd();
  //   },
  // );
  // _rewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
  //   setState(() {
  //     life += 1;
  //   });
  // });
  // _rewardedAd = null;
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
          // onTap: () => _showInterstitialAd(),
          child: Container(
        child: Text('Load AD'),
      )),
    )

        // Column(
        //   children: [
        //     InkWell(
        //         onTap: () => _showInterstitialAd(),
        //         child: Column(
        //           children: [
        //             Text('data'),
        //           ],
        //         ))
        //   ],
        // ),
        );
  }
}

final rewardAdsProvider = StateProvider<RewardedAd?>((ref) => null);
