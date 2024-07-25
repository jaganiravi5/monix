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
import 'package:monix/screens/images/down_image_shimmer.dart';
import 'package:monix/screens/images/image_preview_screen.dart';
import 'package:monix_assets/gen/assets.gen.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:network/download_count/provider/provider.dart';
import 'package:network/images/provider/all_images_provider.dart';
import 'package:network/network.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

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
                        child:  Image.file(
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
                      showLoadingDialog(context, true);
                      await widget.deleteScreenArgs.filePath.delete();
                      showLoadingDialog(context, false);
                      showToast(
                        msg: "Deleted Successfully!",
                        success: true,
                      );
                      context.pop(true);
                      // _downloadMedia(
                      //   bytes: watermarkedImgBytes,
                      //   url: imageAwsUrl,
                      // );
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

  // void _downloadMedia({required File bytes, required String url}) async {
  //   showLoadingDialog(context, true);
  //   Directory? dir;
  //   final imgName = url.split('/').last;
  //   print("imgName $imgName");
  //   // final Uint8List list = bytes.buffer.asUint8List();
  //   if (Platform.isAndroid) {
  //     dir = Directory('/storage/emulated/0/Download/monix');
  //   } else {
  //     final tempDir = await getApplicationDocumentsDirectory();
  //     dir = Directory('${tempDir.path}/monix');
  //   }
  //   if (!(await dir.exists())) {
  //     await dir.create(recursive: true);
  //   }

  //   final fileShape = isPortrait ?? false ? 'portrait' : 'square';
  //   final file = await File('${dir.path}/$fileShape/$imgName').create();
  //   final res = file.writeAsBytesSync(bytes);

  //   showLoadingDialog(context, false);
  // showToast(
  //   msg: "Download Successfully!",
  //   success: true,
  // );
  //   // final result = await DownloadMediaRepository().download(
  //   //   url ?? '',
  //   //   "${dir.path}/${url.split("/").last}",
  //   // );

  //   //if (result != null) {
  //   // showPrimarySnackbar(context: context, text: "Download successfully!");
  //   //} else {
  //   //showPrimarySnackbar(context: context, text: "couldn't load invoice");
  //   //}
  //   //showPrimaryLoading(context, false);
  // }

  Future<void> _shareImg(
      {required String url, required Uint8List imgData}) async {
    // final res = await Share.share('check out this stunning god image $url',);

    // Get the temporary directory
    final directory = await getTemporaryDirectory();

    // Create a file in the temporary directory
    final file = File('${directory.path}/temp.jpg');

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

  // Future<void> _shareImg({required String url}) async {
  //   final res = await Share.share('check out this stunning god image $url');
  //   if (res.status == ShareResultStatus.success) {
  //     print('Thank you for sharing my website!');
  //   }

  //   // showLoadingDialog(context, true);
  //   // Directory dir = await getTemporaryDirectory();
  //   // // final result = await DownloadMediaRepository().download(
  //   // //   url ?? '',
  //   // //   "${dir.path}/${url.split("/").last}",
  //   // // );
  //   // //if (result != null) {
  //   // //   showLoadingDialog(context, false);
  //   //   File tempFile = File('${dir.path}/${url.split("/").last}');
  //   //   // await tempFile.writeAsBytes(data);
  //   //   final XFile file = XFile(tempFile.path);
  //   //   final result = await Share.shareXFiles([file], text: 'Great Docs');
  //   //   if (result.status == ShareResultStatus.success) {
  //   //     print('Thank you for sharing the picture!');
  //   //   }
  //   // //} else {
  //   //   showLoadingDialog(context, false);
  //   // //}
  // }
}

final watermarkLoadProvider = StateProvider<bool>(
  (ref) => true,
);

class DeleteScreenArgs {
  final File filePath;
  final bool isPortrait;
  DeleteScreenArgs({required this.filePath, required this.isPortrait});
}
