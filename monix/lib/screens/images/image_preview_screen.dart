import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_watermark/image_watermark.dart';
import 'package:monix/admob_ads/reward_ads.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/images/down_image_shimmer.dart';
import 'package:monix/screens/images/download_image_screen.dart';
import 'package:monix/screens/images/low_quality_btn.dart';
import 'package:monix/screens/images/no_watermark_btn.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:network/ads/provider/ads_provider.dart';
import 'package:network/network.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImagePreviewScreen extends ConsumerStatefulWidget {
  ImagePreviewScreen({
    super.key,
    this.imgPreviewArgs,
    this.urlData,
  });

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: ImagePreviewScreen(
          imgPreviewArgs: state.extra as ImagePreviewArgs?,
          urlData: state.uri.queryParameters as Map<String, dynamic>?,
        ),
        state: state,
      );
  ImagePreviewArgs? imgPreviewArgs;
  Map<String, dynamic>? urlData;

  @override
  ConsumerState<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends ConsumerState<ImagePreviewScreen> {
  final RewardedAds _rewardedAds = RewardedAds();
  // String uniLink = 'https://monixai.in/homeScreen';
  String imageUrl = '';
  bool? isPortrait;
  String imageName = '';
  String imageId = '';
  String shareUrl = '';
  var watermarkedImgBytes;
  var orgImgBytes;
  @override
  initState() {
    // TODO: implement initState
    if (widget.urlData != null && widget.urlData!.isNotEmpty) {
      imageUrl = widget.urlData?['imageUrl'];
      imageId = widget.urlData?['id'];
      isPortrait = widget.urlData?['isPortrait'] == 'true' ? true : false;
      imageName = widget.urlData?['imageName'];
    }
    if (widget.imgPreviewArgs != null) {
      imageUrl = widget.imgPreviewArgs!.imageUrl;
      imageName = widget.imgPreviewArgs!.imageName;
      imageId = widget.imgPreviewArgs!.imageId;
      isPortrait = widget.imgPreviewArgs?.isPortrait;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      shareUrl =
          'https://monixai.in/imagePreviewScreen?imageUrl=${imageUrl}&isPortrait=${isPortrait}&imageName=${imageName}&id=${imageId}';
      ref.read(watermarkLoadProvider.notifier).state = true;
      getWatermarkImg();
      // print("::::::::WATERMARKIMGGGG${watermarkedImgBytes}");
    });

    super.initState();
  }

  Future<void> getWatermarkImg() async {
    // showLoadingDialog(context, true);
    final String imageUrl1 = "${StringManager.imageUrl}${imageUrl}";

    print('loader--------${ref.read(watermarkLoadProvider.notifier).state}');
    // ref.read(watermarkLoadProvider.notifier).state = true;
    orgImgBytes =
        (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl1))
            .buffer
            .asUint8List();

    ///IMAGE AS WATERMARK
    // final ByteData waterImg =
    // await rootBundle.load(images.waterMarkImg.keyName);
    // final Uint8List waterImgBytes = waterImg.buffer.asUint8List();
    // watermarkedImgBytes = await ImageWatermark.addImageWatermark(
    //   originalImageBytes: orgImgBytes,

    //   waterkmarkImageBytes: waterImgBytes,

    //   imgWidth: 960,

    //   dstY: isPortrait != null && isPortrait! ? 1300 : 840,
    //   dstX: 30, //watermark position X
    // );

    ///TEXT AS WATERMARK
    watermarkedImgBytes = await ImageWatermark.addTextWatermark(
        watermarkText: ' @MONIX_AI_GODS     @MONIX_AI_GODS',
        dstY: isPortrait != null && isPortrait! ? 1300 : 840,
        dstX: 10,
        imgBytes: orgImgBytes,
        color: Colors.white.withOpacity(0.5));
    setState(() {});
    ref.read(watermarkLoadProvider.notifier).state = false;
    // showLoadingDialog(context, false);
  }

  @override
  Widget build(BuildContext context) {
    final String imageAwsUrl = "${StringManager.imageUrl}${imageUrl}";
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: isPortrait != null && !(isPortrait!)
                ? CachedNetworkImage(
                    imageUrl: imageAwsUrl,
                    fit: BoxFit.cover,
                  )
                : !ref.watch(watermarkLoadProvider.notifier).state
                    ? watermarkedImgBytes == null
                        ? SpinKitCircle(
                            color: color.secondary1,
                            size: 70.w,
                          )
                        : Image.memory(
                            watermarkedImgBytes,
                            fit: BoxFit.cover,
                          )
                    : SizedBox(
                        child: Container(
                          color: Colors.transparent,
                          height: 200.w,
                          width: 200.w,
                          alignment: Alignment.center,
                          child: SpinKitCircle(
                            color: color.secondary1,
                            size: 70.w,
                          ),
                        ),
                      ),
          ),
          isPortrait != null && !isPortrait!
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
            isSuffixIcon: true,
            color: color,
            name: imageName,
            onSuffixClick: () {
              _shareImg(url: shareUrl, imgData: watermarkedImgBytes);
              //TODO : share on What'sapp
            },
          ),
          isPortrait != null && !isPortrait!
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
                        color: color.bgColor,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: color.white,
                            spreadRadius: 5,
                            blurRadius: 48,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: !ref.watch(watermarkLoadProvider.notifier).state
                          ? watermarkedImgBytes == null
                              ? SpinKitCircle(
                                  color: color.secondary1,
                                  size: 70.w,
                                )
                              : Image.memory(
                                  watermarkedImgBytes,
                                  fit: BoxFit.cover,
                                )
                          : SizedBox(
                              child: Container(
                                color: Colors.transparent,
                                height: 200.w,
                                width: 200.w,
                                alignment: Alignment.center,
                                child: SpinKitCircle(
                                  color: color.secondary1,
                                  size: 70.w,
                                ),
                              ),
                            ),
                    ),
                  ),
                )
              : SizedBox.shrink(),

          ///BUTTON
          Positioned(
            bottom: 35.w,
            left: 20.w,
            right: 20.w,
            child: Column(
              children: [
                LowQualityBtn(
                    isLoad: ref.watch(watermarkLoadProvider.notifier).state,
                    onBtnTap: () {
                      context.push(
                        AppRoutesPath.downloadImageScreen,
                        extra: ImagePreviewArgs(
                          imageId: imageId,
                          imageUrl: imageUrl,
                          isPortrait: isPortrait!,
                          imageName: imageName,
                          imageData: watermarkedImgBytes,
                        ),
                      );
                    }
                    // context.push(
                    //   AppRoutesPath.downloadImageScreen,
                    // ),
                    ),
                SizedBox(
                  height: 14.w,
                ),
                NoWatermarkBtn(
                    isLoad: ref.watch(watermarkLoadProvider.notifier).state,
                    onBtnTap: () {
                      final rewardId = ref
                          .read(adsDataProvider.notifier)
                          .downloadImageRewardAndroidBtn;

                      if (Platform.isAndroid && rewardId.isNotEmpty) {
                        if (ref.watch(rewardAdsProvider.notifier).state ==
                            null) {
                          print(
                              'Warning: attempt to show reward before loaded.');
                          context.push(
                            AppRoutesPath.downloadImageScreen,
                            extra: ImagePreviewArgs(
                              imageId: imageId,
                              isAdSeen: false,
                              imageUrl: imageUrl,
                              isPortrait: isPortrait!,
                              imageName: imageName,
                              imageData: orgImgBytes,
                            ),
                          );
                        }
                        _rewardedAds.showRewardedAd(
                          ref: ref,
                          context: context,
                          rewardId: ref
                              .read(adsDataProvider.notifier)
                              .downloadImageRewardAndroidBtn,
                          onAdDismissedFullScreen: (p0) {
                            print('RewardAdDismissed');
                            context.push(
                              AppRoutesPath.downloadImageScreen,
                              extra: ImagePreviewArgs(
                                imageId: imageId,
                                // isAdSeen: false,
                                imageUrl: imageUrl,
                                isPortrait: isPortrait!,
                                imageName: imageName,
                                imageData: orgImgBytes,
                              ),
                            );
                          },
                          onAdFailedToShowFullScreen: (p0, p1) {
                            print('RewardAdFailed');
                            context.push(
                              AppRoutesPath.downloadImageScreen,
                              extra: ImagePreviewArgs(
                                imageId: imageId,
                                imageUrl: imageUrl,
                                isPortrait: isPortrait!,
                                imageName: imageName,
                                imageData: orgImgBytes,
                              ),
                            );
                          },
                        );
                      } else {
                        context.push(
                          AppRoutesPath.downloadImageScreen,
                          extra: ImagePreviewArgs(
                            imageId: imageId,
                            imageUrl: imageUrl,
                            isPortrait: isPortrait!,
                            imageName: imageName,
                            imageData: orgImgBytes,
                          ),
                        );
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _shareImg(
      {required String url, required Uint8List imgData}) async {
    // final res = await Share.share('check out this stunning god image $url',);

    // Get the temporary directory
    final directory = await getTemporaryDirectory();

    // Create a file in the temporary directory
    final file = File('${directory.path}/${DateTime.now().millisecond}.jpg');

    // Write the bytes to the file
    await file.writeAsBytes(imgData);
    final res = await Share.shareXFiles([XFile(file.path)],
        text:
            'Check out this awesome image from Monix AI Gods Gallery! 📸 $url');
    if (res.status == ShareResultStatus.success) {
      print('Thank you for sharing Our App!');
    }

    // showLoadingDialog(context, true);
    // Directory dir = await getTemporaryDirectory();
    // // final result = await DownloadMediaRepository().download(
    // //   url ?? '',
    // //   "${dir.path}/${url.split("/").last}",
    // // );
    // //if (result != null) {
    // //   showLoadingDialog(context, false);
    //   File tempFile = File('${dir.path}/${url.split("/").last}');
    //   // await tempFile.writeAsBytes(data);
    //   final XFile file = XFile(tempFile.path);
    //   final result = await Share.shareXFiles([file], text: 'Great Docs');
    //   if (result.status == ShareResultStatus.success) {
    //     print('Thank you for sharing the picture!');
    //   }
    // //} else {
    //   showLoadingDialog(context, false);
    // //}
  }
}

class ImagePreviewAppBar extends StatelessWidget {
  const ImagePreviewAppBar({
    super.key,
    required this.color,
    required this.onSuffixClick,
    this.name,
    required this.isSuffixIcon,
  });

  final MonixColors color;
  final void Function() onSuffixClick;
  final String? name;
  final bool isSuffixIcon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 18.w,
      top: 50.w,
      right: 18.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: color.white,
                  size: 24.w,
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Text(
                name ?? 'Image',
                style: TextStyle(
                  color: color.white,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          isSuffixIcon
              ? SizedBox(
                  width: 88.w,
                  child: CommonSolidButton(
                    title: StringManager.share,
                    onButtonClick: () => onSuffixClick(),
                    isBorder: true,
                    borderRadius: BorderRadius.circular(40.r),
                    borderColor: color.white.withOpacity(0.18),
                    borderWidth: 1.w,
                    fillColor: color.white.withOpacity(0.2),
                    icon: Icon(
                      Icons.share,
                      size: 16.w,
                      color: color.white,
                    ),
                    textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: color.white),
                    padding: EdgeInsets.symmetric(vertical: 8.w),
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}

class ImagePreviewArgs {
  String imageUrl;
  bool isPortrait;
  String imageName;
  String imageId;
  Uint8List? imageData;
  bool? isAdSeen;
  ImagePreviewArgs(
      {Key? key,
      required this.imageId,
      required this.imageUrl,
      required this.isPortrait,
      required this.imageName,
      this.isAdSeen,
      this.imageData});
}
