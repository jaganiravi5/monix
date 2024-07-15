import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:image_watermark/image_watermark.dart';
import 'package:monix/screens/images/down_image_shimmer.dart';
import 'package:network/images/provider/all_images_provider.dart';
import 'package:network/network.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../router/custom_page_transition.dart';
import 'image_preview_screen.dart';

class DownloadImageScreen extends ConsumerStatefulWidget {
  const DownloadImageScreen({
    super.key,
    required this.imagePreviewArgs,
  });

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: DownloadImageScreen(
          imagePreviewArgs: state.extra as ImagePreviewArgs,
        ),
        state: state,
      );
  final ImagePreviewArgs imagePreviewArgs;

  @override
  ConsumerState<DownloadImageScreen> createState() =>
      _DownloadImageScreenState();
}

class _DownloadImageScreenState extends ConsumerState<DownloadImageScreen> {
  var watermarkedImgBytes;
  Random random = Random();
  String baseImgUrl =
      'https://images1.dnaindia.com/images/DNA-EN/900x1600/2023/6/1/1685617819241_krishna.jpg';

  @override
  initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(watermarkLoadProvider.notifier).state = true;
      getWatermarkImg();
    });

    super.initState();
  }

  Future<void> getWatermarkImg() async {
    // showLoadingDialog(context, true);
    final String imageUrl =
        "${StringManager.imageUrl}${widget.imagePreviewArgs.imageUrl}";

    print('loader--------${ref.read(watermarkLoadProvider.notifier).state}');
    // ref.read(watermarkLoadProvider.notifier).state = true;
    Uint8List bytes =
        (await NetworkAssetBundle(Uri.parse(imageUrl)).load(imageUrl))
            .buffer
            .asUint8List();

    // Uint8List waterImgBytes = (await NetworkAssetBundle(Uri.parse(
    //             'https://play-lh.googleusercontent.com/aTdXc0XX08__x6TG5duezcB5xaE0a4aTXMKP3mNwYDkq7mf2QtnvoW2L8GLbCLffwMMl=w240-h480-rw'))
    //         .load(
    //             'https://play-lh.googleusercontent.com/aTdXc0XX08__x6TG5duezcB5xaE0a4aTXMKP3mNwYDkq7mf2QtnvoW2L8GLbCLffwMMl=w240-h480-rw'))
    //     .buffer
    //     .asUint8List();
    // watermarkedImgBytes = await ImageWatermark.addImageWatermark(

    //   originalImageBytes: bytes,
    //   //image bytes
    //   waterkmarkImageBytes: waterImgBytes,
    //   //watermark img bytes
    //   imgHeight: 100,
    //   //watermark img height
    //   imgWidth: 100,
    //   //watermark img width
    //   dstY: 390,
    //   //watermark position Y
    //   dstX: 190, //watermark position X
    // );
    watermarkedImgBytes = await ImageWatermark.addTextWatermark(
        watermarkText: ' @MONIX_AI_GODS     @MONIX_AI_GODS',
        dstY: 900,
        dstX: 80,
        imgBytes: bytes,
        color: Colors.white.withOpacity(0.5));
    setState(() {});
    ref.read(watermarkLoadProvider.notifier).state = false;
    // showLoadingDialog(context, false);
  }

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        "${StringManager.imageUrl}${widget.imagePreviewArgs.imageUrl}";
    final color = Theme.of(context).monixColors;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: imageUrl,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: color.bgColor.withOpacity(0.8),
          ),
          ImagePreviewAppBar(
            color: color,
            name: widget.imagePreviewArgs.imageName,
            onSuffixClick: () {
              _shareImg(url: 'https://monixai.in/homeScreen');
              //TODO : share on What'sapp
            },
          ),
          Positioned(
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
                  child: !ref.watch(watermarkLoadProvider.notifier).state
                      ? watermarkedImgBytes == null
                          ? PrimaryShimmerEffectDownloadImage(
                              shimmerHeight:
                                  MediaQuery.of(context).size.height / 2,
                              shimmerWidth:
                                  MediaQuery.of(context).size.width / 2,
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
                        )

                  // Image.network(

                  //   'https://images1.dnaindia.com/images/DNA-EN/900x1600/2023/6/1/1685617819241_krishna.jpg',
                  //   fit: BoxFit.cover,
                  // ),
                  ),
            ),
          ),
          Positioned(
              bottom: 35.w,
              left: 20.w,
              right: 20.w,
              child: Column(
                children: [
                  CommonButton(
                    title: StringManager.downloadImg,
                    icon: Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Icon(
                        Icons.file_download_outlined,
                        color: color.white,
                        size: 24.w,
                      ),
                    ),
                    onButtonClick: () async {
                      _downloadMedia(
                          bytes: watermarkedImgBytes,
                          url: widget.imagePreviewArgs.imageUrl);
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

  void _downloadMedia({required Uint8List bytes, required String url}) async {
    showLoadingDialog(context, true);
    Directory? dir;
    final imgName = url.split('/').last;
    print("imgName $imgName");
    // final Uint8List list = bytes.buffer.asUint8List();
    if (Platform.isAndroid) {
      dir = Directory('/storage/emulated/0/Download/monix');
    } else {
      final tempDir = await getApplicationDocumentsDirectory();
      dir = Directory('${tempDir.path}/monix');
    }
    if (!(await dir.exists())) {
      await dir.create(recursive: true);
    }
    final file = await File('${dir.path}/$imgName').create();
    final res = file.writeAsBytesSync(bytes);

    showLoadingDialog(context, false);
    showToast(
      msg: "Download Successfully!",
      success: true,
    );
    // final result = await DownloadMediaRepository().download(
    //   url ?? '',
    //   "${dir.path}/${url.split("/").last}",
    // );

    //if (result != null) {
    // showPrimarySnackbar(context: context, text: "Download successfully!");
    //} else {
    //showPrimarySnackbar(context: context, text: "couldn't load invoice");
    //}
    //showPrimaryLoading(context, false);
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

final watermarkLoadProvider = StateProvider<bool>(
  (ref) => true,
);
