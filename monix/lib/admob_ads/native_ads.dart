import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_helper.dart';

class NativeAds {
  void loadNativeAds({required WidgetRef ref}) {
    ref.read(nativeAdNotifierProvider.notifier).state =
        ref.read(nativeAdNotifierProvider.notifier).state.copyWith(isLoading: true);

    NativeAd(
      adUnitId: AdHelper.naiveAdUnitId,
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          debugPrint('--?>>>>>>>$NativeAd loaded.');
          // setState(() {
          ref.read(nativeAdNotifierProvider.notifier).state = ref
              .read(nativeAdNotifierProvider.notifier)
              .state
              .copyWith(nativeAdIsLoaded: true, isLoading: false, nativeAd: ad as NativeAd);
          print("ADLoaded>>>>>>>${ref.watch(nativeAdNotifierProvider.notifier).state.nativeAdIsLoaded}}");
          // _nativeAdIsLoaded = true;
          //});
        },
        onAdFailedToLoad: (ad, error) {
          // Dispose the ad here to free resources.
          debugPrint('$NativeAd failed to load: $error');
          ref.read(nativeAdNotifierProvider.notifier).state =
              ref.read(nativeAdNotifierProvider.notifier).state.copyWith(nativeAdIsLoaded: false, isLoading: false);
          ad.dispose();
        },
        onAdOpened: (ad) {
          ref.read(nativeAdNotifierProvider.notifier).state =
              ref.read(nativeAdNotifierProvider.notifier).state.copyWith(isLoading: false);
          print("AD Opend ---- >>>>>>>>> $ad");
        },
      ),
      request: const AdRequest(),

      // Styling
      nativeTemplateStyle: NativeTemplateStyle(
        // Required: Choose a template.
        templateType: TemplateType.medium,
        // Optional: Customize the ad's style.
        mainBackgroundColor: Colors.purple,
        cornerRadius: 10.0,
        callToActionTextStyle: NativeTemplateTextStyle(
            textColor: Colors.cyan, backgroundColor: Colors.red, style: NativeTemplateFontStyle.monospace, size: 16.0),
        primaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.red, backgroundColor: Colors.cyan, style: NativeTemplateFontStyle.italic, size: 16.0),
        secondaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.green, backgroundColor: Colors.black, style: NativeTemplateFontStyle.bold, size: 16.0),
        tertiaryTextStyle: NativeTemplateTextStyle(
            textColor: Colors.brown, backgroundColor: Colors.amber, style: NativeTemplateFontStyle.normal, size: 16.0),
      ),
    ).load();
  }
}

final nativeAdNotifierProvider = StateNotifierProvider<NativeAdNotifier, NativeAdState>(
  (ref) => NativeAdNotifier(),
);

class NativeAdState {
  late final NativeAd? nativeAd;
  final bool isLoading;
  final bool nativeAdIsLoaded;

  NativeAdState({this.nativeAd, this.isLoading = false, this.nativeAdIsLoaded = false});

  NativeAdState copyWith({NativeAd? nativeAd, bool? isLoading, bool? nativeAdIsLoaded}) {
    return NativeAdState(
      nativeAd: nativeAd ?? this.nativeAd,
      isLoading: isLoading ?? this.isLoading,
      nativeAdIsLoaded: nativeAdIsLoaded ?? this.nativeAdIsLoaded,
    );
  }
}

class NativeAdNotifier extends StateNotifier<NativeAdState> {
  NativeAdNotifier() : super(NativeAdState());

  // void loadNativeAd() {
  //   state = state.copyWith(isLoading: true);
  //   NativeAd(
  //     adUnitId: 'your-ad-unit-id',
  //     factoryId: 'your-factory-id',
  //     request: AdRequest(),
  //     listener: NativeAdListener(
  //       onAdLoaded: (ad) {
  //         state = state.copyWith(nativeAd: ad as NativeAd, isLoading: false);
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         ad.dispose();
  //         state = state.copyWith(isLoading: false);
  //       },
  //     ),
  //   )..load();
  // }

  void disposeNativeAd() {
    state.nativeAd?.dispose();
    state = state.copyWith(nativeAd: null);
  }
}
