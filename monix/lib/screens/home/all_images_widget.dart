import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/images/image_preview_screen.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/images/provider/all_images_provider.dart';
import 'package:network/network.dart';
import 'home_screen.dart';

class AllImagesWidget extends ConsumerStatefulWidget {
  const AllImagesWidget({
    super.key,
    required this.isTitle,
    required this.portraitSel,
    required this.onPortraitTap,
    required this.onSquareTap,
    this.titleText,
    // required this.onImageTap,
    // required this.isLoading,
    this.imagesDataModel,
  });

  final bool isTitle;
  final bool portraitSel;
  final String? titleText;
  final void Function() onPortraitTap;
  final void Function() onSquareTap;
  // final void Function() onImageTap;
  // final bool isLoading;
  final List<ImagesDataModel>? imagesDataModel;

  @override
  ConsumerState<AllImagesWidget> createState() => _AllImagesWidgetState();
}

class _AllImagesWidgetState extends ConsumerState<AllImagesWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    print(':::IMAGE-Length::::${widget.imagesDataModel?.length}');
    final bool isLoading = ref.watch(allImagesDataProvider).isLoading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isTitle
            ? Column(
                children: [
                  Text(
                   widget.titleText?? StringManager.allImages,
                    style: TextStyle(
                      color: color.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              )
            : SizedBox.shrink(),
        ImageSizeWidget(
          isTitle: false,
          onPortraitClick: () => widget.onPortraitTap(),
          onSquareClick: () => widget.onSquareTap(),
          portraitSelected: widget.portraitSel,
        ),
        SizedBox(
          height: 24.w,
        ),
        !isLoading
            ? widget.imagesDataModel != null &&
                    widget.imagesDataModel!.isNotEmpty
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      childAspectRatio: widget.portraitSel ? 9 / 16 : 1,
                    ),
                    itemCount: widget.imagesDataModel?.length,
                    padding: EdgeInsets.only(bottom: 90.w),
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      final String imageUrl = StringManager.imageUrl;
                      return InkWell(
                        onTap: () => context.push(
                          AppRoutesPath.imagePreviewScreen,
                          extra: ImagePreviewArgs(
                            imageUrl:
                                widget.imagesDataModel![index].image ?? '',
                            imageName: widget.imagesDataModel![index].name ?? '',
                            isPortrait: widget.portraitSel,
                          ),
                        ),
                        child: Card(
                          color: color.bgSolidColor,
                          elevation: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${imageUrl}${widget.imagesDataModel![index].image}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    height: MediaQuery.sizeOf(context).height / 2,
                    child: Center(
                      child: Text(
                        'No data found!',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: widget.portraitSel ? 9 / 16 : 1,
                ),
                itemCount: isLoading ? 10 : 1,
                padding: EdgeInsets.only(bottom: 90.h),
                primary: false,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final String imageUrl = StringManager.imageUrl;

                  return isLoading
                      ? PrimaryShimmerEffect(shimmerHeight: 50.w)
                      : widget.imagesDataModel != null &&
                              widget.imagesDataModel!.isNotEmpty
                          ? Card(
                              color: color.white,
                              elevation: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${imageUrl}${widget.imagesDataModel![index].image}",
                                  fit: BoxFit.cover,
                                ),
                              ))
                          : Text(
                              'No data found!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                  // : PrimaryShimmerEffect(shimmerHeight: 50.w);
                },
              )
      ],
    );
  }
}
