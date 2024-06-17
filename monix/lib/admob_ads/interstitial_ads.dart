import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:network/network.dart';

import 'ad_helper.dart';

class InterstitialAds {
  // InterstitialAd? _interstitialAd;
  int maxFailedLoadAttempts = 5;
  int _numInterstitialLoadAttempts = 0;

  void createInterstitialAd({required WidgetRef ref}) {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            ref.read(interAdsProvider.notifier).state = ad;
            print("AD LOADED ---->>>>>>>>>>>>>${ref.watch(interAdsProvider.notifier).state}");
            _numInterstitialLoadAttempts = 0;
            ref.read(interAdsProvider.notifier).state?.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            ref.read(interAdsProvider.notifier).state = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              createInterstitialAd(ref: ref);
            }
          },
        ));
  }

  void showInterstitialAd({
    required WidgetRef ref,
    required Function(InterstitialAd) onAdDismissedFullScreenContent,
    required Function(InterstitialAd, AdError) onAdFailedToShowFullScreenContent,
  }) {
    if (ref.watch(interAdsProvider.notifier).state == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }

    ref.read(interAdsProvider.notifier).state?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        createInterstitialAd(ref: ref);
        onAdDismissedFullScreenContent(ad);
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        createInterstitialAd(ref: ref);
        onAdDismissedFullScreenContent(ad);
      },
    );
    ref.read(interAdsProvider.notifier).state?.show();
    ref.read(interAdsProvider.notifier).state = null;
  }
}

final interAdsProvider = StateProvider<InterstitialAd?>((ref) => null);
