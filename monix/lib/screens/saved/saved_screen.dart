import 'dart:io';

import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/admob_ads/reward_ads.dart';
import 'package:monix/screens/images/image_preview_screen.dart';
import 'package:monix/screens/saved/delete_image_screen.dart';
import 'package:monix/screens/search/search.dart';
import 'package:monix/utils/common_fun.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:network/ads/provider/ads_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../router/custom_page_transition.dart';
import '../../router/routes_name.dart';
import '../home/home_screen.dart';

class SavedScreen extends ConsumerStatefulWidget {
  SavedScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: SavedScreen(),
        state: state,
      );

  @override
  ConsumerState<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends ConsumerState<SavedScreen> {
  // final List<String> downloadedImage = ['jshs'];

  bool isPortraitSel = false;
  Directory? directory;
  List<String>? imageList = [];
  List<File> _imageFiles = [];
  bool? isPermissionGiven;
  final RewardedAds _rewardedAds = RewardedAds();

  DateTime? currentBackPressTime;
bool canPopNow = false;
int requiredSeconds = 2;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      isPermissionGiven = await CommonFun.requestPermission(context);
      print("----------------isPERMISSION $isPermissionGiven");

      await _fetchImages();
    });

    super.initState();
  }

  Future<void> _fetchImages() async {
    Directory? downloadDir;

    if (Platform.isAndroid) {
      downloadDir = Directory('/storage/emulated/0/Download/monix');
    } else if (Platform.isIOS) {
      downloadDir = await getApplicationDocumentsDirectory();
      downloadDir = Directory('${downloadDir.path}/monix');
    }

    if (downloadDir != null && await downloadDir.exists()) {
      List<FileSystemEntity> files = downloadDir.listSync();
      List<File> imageFiles = files
          .where((file) => file is File && _isImageFile(file.path))
          .map((file) => File(file.path))
          .toList();

      setState(() {
        _imageFiles = imageFiles;
      });
    }
  }

  bool _isImageFile(String path) {
    final extension = path.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(extension);
  }

  Future<void> deleteAllImagesInMonixFolder() async {
    // Request storage permission
    if (isPermissionGiven != null && isPermissionGiven!) {
      try {
        final downloadDir = await getApplicationDocumentsDirectory();
        directory = (Platform.isAndroid)
            ? directory = Directory('/storage/emulated/0/Download/monix')
            : directory = Directory('${downloadDir.path}/monix');

        // Check if the folder exists
        if (await directory!.exists()) {
          // Get all files in the directory
          List<FileSystemEntity> files = directory!.listSync();

          // Delete each file
          for (var file in files) {
            if (file is File) {
              await file.delete();
            }
          }
          showToast(
            msg: "All Images Deleted Successfully!",
            success: true,
          );
          _fetchImages();

          print("All images deleted successfully");
        } else {
          showToast(
            msg: "Downloaded images doesn't exist!",
            success: false,
          );
          print("The 'monix' folder doesn't exist");
        }
      } catch (e) {
        showToast(
          msg: "Error deleting images: $e",
          success: false,
        );
        print("Error deleting images: $e");
      }
    } else {
      showToast(
        msg: "Storage permission denied",
        success: false,
      );
      print("Storage permission denied");
    }
  }

  void showRewardAd() {
    _rewardedAds.showRewardedAd(
      ref: ref,
      rewardId:
          ref.read(adsDataProvider.notifier).downloadImageRewardAndroidBtn,
      context: context,
      onAdDismissedFullScreen: (p0) {
        deleteAllImagesInMonixFolder();
        print('RewardAdDismissed');
      },
      onAdFailedToShowFullScreen: (p0, p1) {
        deleteAllImagesInMonixFolder();
        print('RewardAdFailed');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    print(":::::LENGTH:::LOCAL::::${_imageFiles?.length}");
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar( 
        color: color,
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        title: StringManager.monixAi,
        text: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            StringManager.savedItems,
            style: TextStyle(
              color: color.white,
              fontSize: 21.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leadingWidth: 12.w,
        icon: icons.menu.svg(
          width: 12.w,
          height: 12.w,
          fit: BoxFit.contain,
        ),
      ),
      body: PopScope(
        canPop: canPopNow,
        onPopInvoked:(didPop) {
          print("onDidPop-$didPop");
         onPopInvoked(didPop,currentBackPressTime);
          
        },
        child: Stack(
          children: [
            isPermissionGiven != null && isPermissionGiven!
                ? _imageFiles.isEmpty
                    ? NoImageWidget(color: color)
                    : SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 70.w,
                            left: 20.w,
                            right: 20.w,
                          ),
                          child: DownloadedImgWidget(
                            onDelete: () {
                              _fetchImages();
                              setState(() {});
                            },
                            imageFiles: _imageFiles,
                            portraitSel: isPortraitSel,
                            isLoading:
                                ref.watch(tempLoadingProvider.notifier).state,
                            onPortraitTap: () {
                              isPortraitSel = !isPortraitSel;
                              setState(() {});
                            },
                            onSquareTap: () {
                              isPortraitSel = !isPortraitSel;
                              setState(() {});
                            },
                          ),
                        ),
                      )
                : NoImageWidget(
                    color: color,
                    isPermissionGiven: isPermissionGiven,
                  ),
            _imageFiles.isNotEmpty
                ? Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 45.w,
                      color: color.bgSolidColor,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringManager.allDownloadImg,
                            style: TextStyle(
                              color: color.grey500,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showAnimatedDialog(
                                context,
                                WarningPopup(
                                    color: color,
                                    onRightTap: () {
                                      if (Platform.isAndroid &&
                                          ref
                                              .read(adsDataProvider.notifier)
                                              .downloadImageRewardAndroidBtn
                                              .isNotEmpty) {
                                        if (ref
                                                .watch(rewardAdsProvider.notifier)
                                                .state ==
                                            null) {
                                          deleteAllImagesInMonixFolder();
                                        } else {
                                          showRewardAd();
                                        }
                                      }
                                    }),
                              );
                            },
                            child: Text(
                              StringManager.deleteAll,
                              style: TextStyle(
                                color: color.secondary1,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
  
  void onPopInvoked(bool didPop, DateTime? currentBackPressTime) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || 
        now.difference(currentBackPressTime) > Duration(seconds: requiredSeconds)) {
      currentBackPressTime = now;
      showToast(msg: 'Exit Warning');
      // Fluttertoast.showToast(msg: 'exit_warning');
      Future.delayed(
        Duration(seconds: requiredSeconds),
        () {
          // Disable pop invoke and close the toast after 2s timeout
          setState(() {
            canPopNow = false;
          });
          // Fluttertoast.cancel();
        },
      );
      // Ok, let user exit app on the next back press
      setState(() {
        canPopNow = true;
      });
        }}
}


class WarningPopup extends StatelessWidget {
  const WarningPopup({
    super.key,
    required this.color,
    required this.onRightTap,
  });

  final MonixColors color;
  final void Function() onRightTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 310.w,
      ),
      backgroundColor: color.bgSolidColor,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 44.sp,
              color: Colors.red[800],
            ),
            SizedBox(
              height: 14.w,
            ),
            Text(
              'Are you sure want to delete all downloaded images?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            // SizedBox(
            //   height: 32.w,
            // ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => context.pop(),
                    child: SizedBox(
                      height: 40.w,
                      width: 50.w,
                      child: Center(
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: color.grey500,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () {
                      context.pop();
                      onRightTap();
                    },
                    child: SizedBox(
                      height: 40.w,
                      width: 50.w,
                      child: Center(
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.red[800],
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadedImgWidget extends StatefulWidget {
  DownloadedImgWidget({
    super.key,
    required this.onPortraitTap,
    required this.onSquareTap,
    required this.portraitSel,
    required this.isLoading,
    required this.imageFiles,
    required this.onDelete,
  });

  final void Function() onPortraitTap;
  final void Function() onSquareTap;
  final void Function() onDelete;

  final bool portraitSel;
  final List<File> imageFiles;
  final bool isLoading;

  @override
  State<DownloadedImgWidget> createState() => _DownloadedImgWidgetState();
}

class _DownloadedImgWidgetState extends State<DownloadedImgWidget> {
  List<File> portraitImgData = [];
  List<File> squareImgData = [];

  @override
  Widget build(BuildContext context) {
    portraitImgData.clear();
    squareImgData.clear();
    widget.imageFiles.forEach(
      (element) {
        if (element.path.contains('square')) {
          squareImgData.add(element);
        } else {
          portraitImgData.add(element);
        }
      },
    );
    final color = Theme.of(context).monixColors;
    final localImgData = widget.portraitSel ? portraitImgData : squareImgData;

    return Column(
      children: [
        ImageSizeWidget(
          isTitle: false,
          onPortraitClick: () => widget.onPortraitTap(),
          onSquareClick: () => widget.onSquareTap(),
          portraitSelected: widget.portraitSel,
        ),
        SizedBox(
          height: 20.w,
        ),
        localImgData.isNotEmpty
            ? GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: widget.portraitSel ? 9 / 16 : 1,
                ),
                itemCount: localImgData.length,
                padding: EdgeInsets.only(bottom: 90.h),
                primary: false,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return !widget.isLoading
                      ? InkWell(
                          onTap: () async {
                            final bool? isPop = await context.push<bool>(
                              AppRoutesPath.deleteImageScreen,
                              extra: DeleteScreenArgs(
                                  filePath: localImgData[index],
                                  isPortrait: widget.portraitSel),
                            );
                            if (isPop != null) {
                              widget.onDelete();
                              setState(() {});
                            }else{
                               widget.onDelete();
                              setState(() {});
                            }
                          },
                          child: Card(
                            color: color.white,
                            elevation: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.file(
                                fit: BoxFit.cover,
                                File(
                                  localImgData[index].path,
                                ),
                              ),
                            ),
                          ),
                        )
                      : PrimaryShimmerEffect(shimmerHeight: 40.w);
                },
              )
            : Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: NoImageWidget(
                    color: color,
                  ),
                ),
              ),
      ],
    );
  }
}

class NoImageWidget extends StatelessWidget {
  NoImageWidget({
    super.key,
    required this.color,
    this.isPermissionGiven,
  });

  final MonixColors color;
  bool? isPermissionGiven;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icons.noImage.svg(),
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isPermissionGiven != null && !(isPermissionGiven!)
                  ? "You don't have given permission"
                  : "${StringManager.noImg} ",
              style: TextStyle(
                color: color.grey500,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            // Text(
            //   "${StringManager.search}",
            // style: TextStyle(
            //   color: color.white,
            //   decorationStyle: TextDecorationStyle.solid,
            //   decorationColor: color.white,
            //   decoration: TextDecoration.underline,
            //   fontSize: 16.sp,
            //   fontWeight: FontWeight.w400,
            // ),
            // ),
          ],
        ),
        isPermissionGiven != null && !(isPermissionGiven!)
            ? InkWell(
                onTap: () async => await openAppSettings(),
                child: Text(
                  "Open Settings",
                  style: TextStyle(
                    color: color.white,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: color.white,
                    decoration: TextDecoration.underline,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
