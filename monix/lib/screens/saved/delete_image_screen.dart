import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_watermark/image_watermark.dart';
import 'package:monix/admob_ads/interstitial_ads.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/images/down_image_shimmer.dart';
import 'package:monix/screens/images/image_preview_screen.dart';
import 'package:monix_assets/gen/assets.gen.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:network/download_count/provider/provider.dart';
import 'package:network/images/provider/all_images_provider.dart';
import 'package:network/network.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                      if (ref.read(interAdsProvider.notifier).state == null) {
                        print(
                            'Warning: attempt to show interstitial before loaded.');
                            await _onDeleteTap(context);
                      } else {
                        _interstitialAds.showInterstitialAd(
                          ref: ref,
                          context: context,
                          onAdDismissedFullScreenContent: (p0) async => await _onDeleteTap(context),
                          onAdFailedToShowFullScreenContent: (p0, p1) async =>
                               await _onDeleteTap(context),
                        );
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
    showLoadingDialog(context, true);
    await widget.deleteScreenArgs.filePath.delete();
    showLoadingDialog(context, false);
    showToast(
      msg: "Deleted Successfully!",
      success: true,
    );
    context.pop(true);
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
