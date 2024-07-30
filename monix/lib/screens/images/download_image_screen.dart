import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:network/ads/provider/provider.dart';
import 'package:network/download_count/provider/provider.dart';
import 'package:network/network.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../router/custom_page_transition.dart';
import 'image_preview_screen.dart';

class DownloadImageScreen extends ConsumerStatefulWidget {
  DownloadImageScreen({
    super.key,
    this.imagePreviewArgs,
    // this.urlData,
  });

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: DownloadImageScreen(
          imagePreviewArgs: state.extra as ImagePreviewArgs?,
          // urlData: state.uri.queryParameters as Map<String, dynamic>?,
        ),
        state: state,
      );
  ImagePreviewArgs? imagePreviewArgs;
  // Map<String, dynamic>? urlData;

  @override
  ConsumerState<DownloadImageScreen> createState() =>
      _DownloadImageScreenState();
}

class _DownloadImageScreenState extends ConsumerState<DownloadImageScreen> {
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
    getWatermarkImg();
    // if (widget.urlData != null && widget.urlData!.isNotEmpty) {
    //   imageUrl = widget.urlData?['imageUrl'];
    //   imageId = widget.urlData?['id'];
    //   isPortrait = widget.urlData?['isPortrait'];
    //   imageName = widget.urlData?['imageName'];
    // }
    if (widget.imagePreviewArgs != null) {
      imageUrl = widget.imagePreviewArgs!.imageUrl;
      imageName = widget.imagePreviewArgs!.imageName;
      imageId = widget.imagePreviewArgs!.imageId;
      isPortrait = widget.imagePreviewArgs?.isPortrait;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      shareUrl =
          'https://monixai.in/imagePreviewScreen?imageUrl=${imageUrl}&isPortrait=${isPortrait}&imageName=${imageName}&id=${imageId}';
      // ref.read(watermarkLoadProvider.notifier).state = true;

      print("::::::::WATERMARKIMGGGG${watermarkedImgBytes}");
    });

    super.initState();
  }

  getWatermarkImg() {
    if (widget.imagePreviewArgs?.imageData != null) {
      watermarkedImgBytes = widget.imagePreviewArgs?.imageData!;
    }
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
                    fit: BoxFit.cover,
                    imageUrl: imageAwsUrl,
                  )
                : watermarkedImgBytes == null
                    ? SpinKitCircle(
                        color: color.secondary1,
                        size: 70.w,
                      )
                    : Image.memory(
                        watermarkedImgBytes,
                        fit: BoxFit.cover,
                      ),
          ),
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
            isSuffixIcon: true,
            color: color,
            name: imageName,
            onSuffixClick: () {
              _shareImg(url: shareUrl, imgData: watermarkedImgBytes, ref: ref);
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
                        child: watermarkedImgBytes == null
                            ? SpinKitCircle(
                                color: color.secondary1,
                                size: 70.w,
                              )
                            : Image.memory(
                                watermarkedImgBytes,
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

          ///DOWNLOAD BUTTON
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
                      _downloadCountApi(imageId: imageId);
                      _downloadMedia(
                        bytes: watermarkedImgBytes,
                        url: imageAwsUrl,
                      );
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

  Future<bool> _downloadCountApi({required String imageId}) async {
    showLoadingDialog(context, true);
    await ref
        .read(downloadCountDataProvider.notifier)
        .downloadCount(imgId: imageId);

    final data = await ref.read(downloadCountDataProvider).downloadCountModel;
    if (data != null) {
      //  Fluttertoast.showToast(msg: "Submitted Successfully! !");

      showLoadingDialog(context, false);
      // mediaUrl = data[0].url ?? '';
      return true;
    } else {
      showLoadingDialog(context, false);
      // showPrimarySnackbar(context: context, text: "${error?.message}");
      return false;
    }
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

    final fileShape = isPortrait ?? false ? 'portrait' : 'square';
    final file = await File(
            '${dir.path}/${fileShape}_${DateTime.now().millisecond}_$imgName')
        .create();
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

  Future<void> _shareImg({
    required String url,
    required Uint8List imgData,
    required WidgetRef ref,
  }) async {
    final ytUrl = ref.watch(adsDataProvider.notifier).ytUrl;
    final instaUrl = ref.watch(adsDataProvider.notifier).instaUrl;
    final wpUrl = ref.watch(adsDataProvider.notifier).wpUrl;

    // Get the temporary directory
    final directory = await getTemporaryDirectory();

    // Create a file in the temporary directory
    final file = File('${directory.path}/temp.jpg');

    // Write the bytes to the file
    await file.writeAsBytes(imgData);
// Construct the share message
    String message =
        'Check out this awesome image from Monix AI Gods Gallery! 📸 $url';

    if (ytUrl.isNotEmpty) {
      message += '\n\nYouTube: $ytUrl\n';
    }
    if (instaUrl.isNotEmpty) {
      message += '\nInstagram: $instaUrl\n';
    }
    if (wpUrl.isNotEmpty) {
      message += '\nWhatsApp: $wpUrl';
    }

    final res = await Share.shareXFiles([XFile(file.path)],
        text:
           message);
    if (res.status == ShareResultStatus.success) {
      print('Thank you for sharing Our App!');
    }
  }
}

final watermarkLoadProvider = StateProvider<bool>(
  (ref) => true,
);
