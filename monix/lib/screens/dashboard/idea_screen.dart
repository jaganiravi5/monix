import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:monix/admob_ads/ad_helper.dart';
import 'package:monix/admob_ads/native_ads.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix_assets/monix_assets.dart';

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
  final nameController = TextEditingController();
  final ideaController = TextEditingController();

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
        backgroundColor: color.bgColor,
        appBar: CommonAppBar(
          color: color,
          title: StringManager.yourSuggestion,
          leadingWidth: 44.w,
          icon: InkWell(
            onTap: () => context.pop(),
            child: Icon(
              Icons.arrow_back_rounded,
              color: color.white,
              size: 28.h,
            ),
          ),
          suffixIcon: images.star.image(width: 24.w, height: 24.w, fit: BoxFit.cover),
          onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            top: 22.w,
            right: 20.w,
            bottom: 22.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    StringManager.suggestionDesc,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: color.grey500.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                  CommonTextFormField(
                    color: color,
                    controller: nameController,
                    hintText: StringManager.enterName,
                  ),
                  SizedBox(
                    height: 18.w,
                  ),
                  CommonTextFormField(
                    color: color,
                    hintText: StringManager.yourSuggestionHint,
                    controller: nameController,
                    maxLines: 6,
                  ),
                ],
              ),

              CommonButton(
                title: StringManager.submitSuggestion,
                // icon: Padding(
                //   padding: EdgeInsets.only(right: 5.w),
                //   child: Icon(
                //     Icons.file_download_outlined,
                //     color: color.white,
                //     size: 24.w,
                //   ),
                // ),
                onButtonClick: () async {
                  // _downloadMedia(bytes: watermarkedImgBytes, url: baseImgUrl);
                },
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: color.white,
                ),
              )
              // ref.watch(nativeAdNotifierProvider.notifier).state.nativeAdIsLoaded
              //     ? ConstrainedBox(
              //         constraints: BoxConstraints(
              //           minWidth: 180.w, // minimum recommended width
              //           minHeight: 190.w, // minimum recommended height
              //           maxWidth: MediaQuery.of(context).size.width / 2,
              //           maxHeight: 290.w,
              //         ),
              //         child: ref.watch(nativeAdNotifierProvider.notifier).state.nativeAd != null
              //             ? AdWidget(ad: ref.watch(nativeAdNotifierProvider.notifier).state.nativeAd!)
              //             : Text('No Data Found'),
              //       )
              //     : CircularProgressIndicator(),
            ],
          ),
        )
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
