import 'dart:io';
import 'dart:math';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/admob_ads/interstitial_ads.dart';
import 'package:monix/screens/images/image_preview_screen.dart';
import 'package:network/ads/provider/provider.dart';
import 'package:network/network.dart';
import '../../router/custom_page_transition.dart';

class DeleteImageScreen extends ConsumerStatefulWidget {
  DeleteImageScreen({
    super.key,
    required this.deleteScreenArgs,
  });

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: DeleteImageScreen(
          deleteScreenArgs: state.extra as DeleteScreenArgs,
        ),
        state: state,
      );
  DeleteScreenArgs deleteScreenArgs;

  @override
  ConsumerState<DeleteImageScreen> createState() => _DownloadImageScreenState();
}

class _DownloadImageScreenState extends ConsumerState<DeleteImageScreen> {
  var watermarkedImgBytes;
  Random random = Random();
  String imageUrl = '';
  bool? isPortrait;
  String imageName = '';
  String imageId = '';

  String shareUrl = '';

  @override
  initState() {
    // TODO: implement initState

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    isPortrait = widget.deleteScreenArgs.isPortrait;
    // });

    super.initState();
  }

  final InterstitialAds _interstitialAds = InterstitialAds();

  @override
  Widget build(BuildContext context) {
    // final String imageAwsUrl = "${StringManager.imageUrl}${imageUrl}";
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.file(
                File(widget.deleteScreenArgs.filePath.path),
                fit: BoxFit.cover,
              )),
          isPortrait != null && !(isPortrait!)
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: color.bgColor.withOpacity(0.8),
                )
              : SizedBox.shrink(),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.black,
                    color.black.withOpacity(0.3),
                    Colors.transparent
                  ], // Red to orange (adjust as needed)
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.8, 1],
                ),
              ),
            ),
          ),
          ImagePreviewAppBar(
            isSuffixIcon: false,
            color: color,
            name: imageName,
            onSuffixClick: () {
              // _shareImg(url: shareUrl, imgData: watermarkedImgBytes);
              //TODO : share on What'sapp
            },
          ),
          isPortrait != null && !(isPortrait!)
              ? Positioned(
                  top: 240.w,
                  bottom: 240.w,
                  left: 20.w,
                  right: 20.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: [
                              BoxShadow(
                                color: color.white,
                                spreadRadius: 5,
                                blurRadius: 48,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            color: color.bgColor),
                        child: Image.file(
                          File(widget.deleteScreenArgs.filePath.path),
                          fit: BoxFit.cover,
                        )

                        // Image.network(

                        //   'https://images1.dnaindia.com/images/DNA-EN/900x1600/2023/6/1/1685617819241_krishna.jpg',
                        //   fit: BoxFit.cover,
                        // ),
                        ),
                  ),
                )
              : SizedBox.shrink(),

          ///DELETE BUTTON
          Positioned(
              bottom: 35.w,
              left: 20.w,
              right: 20.w,
              child: Column(
                children: [
                  CommonButton(
                    title: StringManager.deleteImg,
                    icon: Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Icon(
                        Icons.delete,
                        color: color.white,
                        size: 24.w,
                      ),
                    ),
                    onButtonClick: () async {
                      if (Platform.isAndroid &&
                          ref
                              .watch(adsDataProvider.notifier)
                              .interAndroidDeleteBtn
                              .isNotEmpty) {
                        if (ref.read(interAdsProvider.notifier).state == null) {
                          print(
                              'Warning: attempt to show interstitial before loaded.');
                          final interAndroidSkipBtn = ref
                              .watch(adsDataProvider.notifier)
                              .interAndroidDeleteBtn;
                          _interstitialAds.showInterstitialAd(
                            ref: ref,
                            interAdId: interAndroidSkipBtn,
                            context: context,
                            onAdDismissedFullScreenContent: (p0) async =>
                                await _onDeleteTap(context),
                            onAdFailedToShowFullScreenContent: (p0, p1) async =>
                                await _onDeleteTap(context),
                          );
                          await _onDeleteTap(context);
                        } else {
                          final interAndroidSkipBtn = ref
                              .watch(adsDataProvider.notifier)
                              .interAndroidDeleteBtn;
                          _interstitialAds.showInterstitialAd(
                            ref: ref,
                            interAdId: interAndroidSkipBtn,
                            context: context,
                            onAdDismissedFullScreenContent: (p0) async =>
                                await _onDeleteTap(context),
                            onAdFailedToShowFullScreenContent: (p0, p1) async =>
                                await _onDeleteTap(context),
                          );
                        }
                      }
                    },
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: color.white,
                    ),
                  )
                  // LowQualityBtn(),
                  // SizedBox(height: 14.w,),
                  // NoWatermarkBtn()
                ],
              ))
        ],
      ),
    );
  }

  Future<void> _onDeleteTap(BuildContext context) async {
  try {
    showLoadingDialog(context, true);
    
    final file = File(widget.deleteScreenArgs.filePath.path);
    if (await file.exists()) {
      await file.delete();
      showToast(
        msg: "Deleted Successfully!",
        success: true,
      );
      context.pop(true);
    } else {
      showToast(
        msg: "File not found",
        success: false,
      );
    }
  } catch (e) {
    showToast(
      msg: "Error deleting file: ${e.toString()}",
      success: false,
    );
  } finally {
    showLoadingDialog(context, false);
  }
}
}

final watermarkLoadProvider = StateProvider<bool>(
  (ref) => true,
);

class DeleteScreenArgs {
  final File filePath;
  final bool isPortrait;
  DeleteScreenArgs({required this.filePath, required this.isPortrait});
}
