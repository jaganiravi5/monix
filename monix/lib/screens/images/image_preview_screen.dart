import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/admob_ads/reward_ads.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/images/low_quality_btn.dart';
import 'package:monix/screens/images/no_watermark_btn.dart';
import 'package:network/network.dart';
import 'package:share_plus/share_plus.dart';

class ImagePreviewScreen extends ConsumerStatefulWidget {
  ImagePreviewScreen({super.key, required this.isPortrait});

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: ImagePreviewScreen(
          isPortrait: state.extra as bool,
        ),
        state: state,
      );
  final bool isPortrait;

  @override
  ConsumerState<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends ConsumerState<ImagePreviewScreen> {
  final RewardedAds _rewardedAds = RewardedAds();
  String uniLink = 'https://monixai.in/homeScreen';
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              'https://images1.dnaindia.com/images/DNA-EN/900x1600/2023/6/1/1685617819241_krishna.jpg',
              fit: BoxFit.cover,
            ),
          ),
          !widget.isPortrait
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
            color: color,
            onSuffixClick: () {
              _shareImg(url: 'https://monixai.in/homeScreen');
              //TODO : share on What'sapp
            },
          ),
          !widget.isPortrait
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
                      ),
                      child: Image.network(
                        'https://images1.dnaindia.com/images/DNA-EN/900x1600/2023/6/1/1685617819241_krishna.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
          Positioned(
              bottom: 35.w,
              left: 20.w,
              right: 20.w,
              child: Column(
                children: [
                  LowQualityBtn(onBtnTap: () {
                    context.push(
                      AppRoutesPath.downloadImageScreen,
                    );
                  }
                      // context.push(
                      //   AppRoutesPath.downloadImageScreen,
                      // ),
                      ),
                  SizedBox(
                    height: 14.w,
                  ),
                  NoWatermarkBtn(onBtnTap: () {
                    _rewardedAds.showRewardedAd(
                      ref: ref,
                      context: context,
                      onAdDismissedFullScreen: (p0) {
                        print('RewardAdDismissed');
                        context.push(
                          AppRoutesPath.downloadImageScreen,
                        );
                      },
                      onAdFailedToShowFullScreen: (p0, p1) {
                         print('RewardAdFailed');
                        context.push(
                          AppRoutesPath.downloadImageScreen,
                        );
                      },
                    );
                  }
                      // context.push(
                      //   AppRoutesPath.downloadImageScreen,
                      // ),
                      )
                ],
              ))
        ],
      ),
    );
  }
  Future<void> _shareImg({required String url}) async {
    final res = await Share.share('check out this stunning god image $url');
    if (res.status == ShareResultStatus.success) {
      print('Thank you for sharing my website!');
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
  });

  final MonixColors color;
  final void Function() onSuffixClick;

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
                'Hanuman',
                style: TextStyle(
                  color: color.white,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 108.w,
            child: CommonSolidButton(
              title: "share",
              onButtonClick: () => onSuffixClick(),
              isBorder: true,
              borderRadius: BorderRadius.circular(40.r),
              borderColor: color.white.withOpacity(0.18),
              borderWidth: 1.w,
              fillColor: color.white.withOpacity(0.2),
              icon: Icon(
                Icons.share,
                color: color.white,
              ),
              textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: color.white),
              padding: EdgeInsets.symmetric(vertical: 9.w),
            ),
          )
        ],
      ),
    );
  }
 
}
