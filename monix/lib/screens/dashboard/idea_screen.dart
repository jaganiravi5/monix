import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:monix/admob_ads/ad_helper.dart';
import 'package:monix/admob_ads/native_ads.dart';
import 'package:monix/router/custom_page_transition.dart';

import '../../router/routes_name.dart';

class IdeaScreen extends ConsumerStatefulWidget {
  const IdeaScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const IdeaScreen(),
        state: state,
      );

  @override
  ConsumerState<IdeaScreen> createState() => _IdeaScreenState();
}

class _IdeaScreenState extends ConsumerState<IdeaScreen> {
  // NativeAd? nativeAd;
  bool _nativeAdIsLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    //loadAd();

    super.initState();
  }

  // /// Loads a native ad.
  // void loadAd() {
  //   nativeAd = NativeAd(
  //     adUnitId: AdHelper.naiveAdUnitId,
  //     listener: NativeAdListener(
  //       onAdLoaded: (ad) {
  //         debugPrint('$NativeAd loaded.');
  //         setState(() {
  //           _nativeAdIsLoaded = true;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, error) {
  //         // Dispose the ad here to free resources.
  //         debugPrint('$NativeAd failed to load: $error');
  //         ad.dispose();
  //       },
  //       onAdOpened: (ad) {
  //         print("AD Opend ---- >>>>>>>>> $ad");
  //       },
  //     ),
  //     request: const AdRequest(),
  //
  //     // Styling
  //     nativeTemplateStyle: NativeTemplateStyle(
  //       // Required: Choose a template.
  //       templateType: TemplateType.medium,
  //       // Optional: Customize the ad's style.
  //       mainBackgroundColor: Colors.purple,
  //       cornerRadius: 10.0,
  //       callToActionTextStyle: NativeTemplateTextStyle(
  //           textColor: Colors.cyan, backgroundColor: Colors.red, style: NativeTemplateFontStyle.monospace, size: 16.0),
  //       primaryTextStyle: NativeTemplateTextStyle(
  //           textColor: Colors.red, backgroundColor: Colors.cyan, style: NativeTemplateFontStyle.italic, size: 16.0),
  //       secondaryTextStyle: NativeTemplateTextStyle(
  //           textColor: Colors.green, backgroundColor: Colors.black, style: NativeTemplateFontStyle.bold, size: 16.0),
  //       tertiaryTextStyle: NativeTemplateTextStyle(
  //           textColor: Colors.brown, backgroundColor: Colors.amber, style: NativeTemplateFontStyle.normal, size: 16.0),
  //     ),
  //   )..load();
  // }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
        appBar: CommonAppBar(
          color: color,
          title: StringManager.idea,
          leadingWidth: 44.w,
          icon: InkWell(
            onTap: () => context.pop(),
            child: Icon(
              Icons.arrow_back_rounded,
              color: color.white,
              size: 28.h,
            ),
          ),
          onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        ),
        body: ref.watch(nativeAdNotifierProvider.notifier).state.nativeAdIsLoaded
            ? ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 320, // minimum recommended width
                  minHeight: 90, // minimum recommended height
                  maxWidth: 400,
                  maxHeight: 200,
                ),
                child: ref.watch(nativeAdNotifierProvider.notifier).state.nativeAd != null
                    ? AdWidget(ad: ref.watch(nativeAdNotifierProvider.notifier).state.nativeAd!)
                    : Text('No Data Found'),
              )
            : CircularProgressIndicator()
        // ConstrainedBox(
        //   constraints:  BoxConstraints(
        //     minWidth: 320, // minimum recommended width
        //     minHeight: 90, // minimum recommended height
        //     maxWidth: 400,
        //     maxHeight: 200,
        //   ),
        //   child: nativeAd != null ? AdWidget(ad: nativeAd!) : Text('No Data Found'),
        // ),
        );
  }
}
