import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/images/download_image_screen.dart';
import 'package:monix/screens/images/image_preview_screen.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/images/provider/all_images_provider.dart';
import 'package:network/images/provider/provider.dart';
import 'package:network/network.dart';
import 'home_screen.dart';

class AllImagesWidget extends ConsumerStatefulWidget {
  AllImagesWidget({
    super.key,
    required this.isTitle,
    required this.portraitSel,
    required this.onPortraitTap,
    required this.onSquareTap,
    this.titleText,
    required this.scrollController,
    // required this.onImageTap,
    // required this.isLoading,
    this.imagesDataModel,
  });

  final bool isTitle;
  final bool portraitSel;
  final String? titleText;
  final void Function() onPortraitTap;
  final void Function() onSquareTap;
  final ScrollController scrollController;
  // final void Function() onImageTap;
  // final bool isLoading;
  List<ImagesDataModel>? imagesDataModel;

  @override
  ConsumerState<AllImagesWidget> createState() => _AllImagesWidgetState();
}

class _AllImagesWidgetState extends ConsumerState<AllImagesWidget> {
  // final _onGoingScrollController = ScrollController();
  // late final ScrollController _scrollController = ScrollController()
  //   ..addListener(
  //     () async {
  //       if (ref.read(allImagesDataProvider.notifier).isPagination) {
  //         final page = ref.watch(pageProvider);
  //         final pageSize = ref.watch(pageSizeProvider);
  //         final total = ref.watch(allImagesDataProvider).allImages.total;
  //         if (((page) * pageSize) < (total ?? 0) &&
  //             _scrollController.offset >=
  //                 _scrollController.position.maxScrollExtent &&
  //             !_scrollController.position.outOfRange) {
  //           ref.read(allImagesDataProvider.notifier).state =
  //               ref.read(allImagesDataProvider).copyWith(isLoadingMore: true);
  //           ref.read(allImagesDataProvider.notifier).fetchNextBatch(
  //                 type: widget.portraitSel ? 'reel' : 'post',
  //                 page: page,
  //                 limit: 18,
  //               );
  //         }
  //       }
  //     },
  //   );

  // Future<void> _onGoingScrollListener() async {
  //   final page = ref.read(getOnGoingAppointmentListDataProvider.notifier).page;
  //   final totalCount = ref.read(getOnGoingAppointmentListDataProvider.notifier).totalCount;

  //   // Check if more items are available to load
  //   if (((page) * 10) < (totalCount) &&
  //       _onGoingScrollController.offset >= _onGoingScrollController.position.maxScrollExtent &&
  //       !_onGoingScrollController.position.outOfRange) {
  //     final dropDownProvider = ref.watch(doctorLocationStateProvider);
  //     await ref.read(allImagesDataProvider.notifier).getOnGoingAppointmentList(
  //           locationID: dropDownProvider.mainDropDownValue?.id ?? '',
  //         );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
      final isLoadingMore = ref.watch(allImagesDataProvider).isLoadingMore;
    widget.imagesDataModel =
        ref.watch(allImagesDataProvider.notifier).getAllImages();
    print(":::::::::DATAA:::::::::::::");
    print(
        ':::PAGINATION-----------Length:::::::::::${widget.imagesDataModel?.length}');
    final bool isLoading = ref.watch(allImagesDataProvider).isLoading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isTitle
            ? Column(
                children: [
                  Text(
                    widget.titleText ?? StringManager.allImages,
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
                    //  physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: isLoadingMore?(widget.imagesDataModel?.length??0)+1:widget.imagesDataModel?.length,
                    padding: EdgeInsets.only(bottom: 90.w),
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      final String imageUrl = StringManager.imageUrl;
                      final totalCount = ref.watch(allImagesDataProvider).allImages.total;
                    
                      if (index == totalCount ||
                          (index == widget.imagesDataModel?.length && !isLoadingMore)) {
                        return const SizedBox.shrink();
                      } else if (index == widget.imagesDataModel?.length) {
                        print("ISLOADDDDDDDDDD::::::::::::::::");
                        return PrimaryShimmerEffect(shimmerHeight: 60.w);
                      } else {
                        return InkWell(
                          onTap: () {
                            ref.read(watermarkLoadProvider.notifier).state=true;
                            context.push(
                            AppRoutesPath.imagePreviewScreen,
                            extra: ImagePreviewArgs(
                              imageUrl:
                                  widget.imagesDataModel![index].image ?? '',
                                  imageId: widget.imagesDataModel?[index].id??'',
                              imageName:
                                  widget.imagesDataModel![index].name ?? '',
                              isPortrait: widget.portraitSel,
                            ),
                          );
                          },
                          child: Card(
                            color: color.bgSolidColor,
                            elevation: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${imageUrl}${widget.imagesDataModel![index].image}",
                                fit: BoxFit.cover,
                                
                                errorWidget: (context, url, error) {
                                  return Container();
                                },
                              ),
                            ),
                          ),
                        );
                      }
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

                  return
                      PrimaryShimmerEffect(shimmerHeight: 50.w);
                      
                      
                  // : PrimaryShimmerEffect(shimmerHeight: 50.w);
                },
              )
      ],
    );
  }
}
