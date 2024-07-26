import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/primary_simmer_effect.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/router/routes_name.dart';
import 'package:monix/screens/home/all_images_widget.dart';
import 'package:monix/screens/home/category_widget.dart';
import 'package:monix/screens/home/new_images_widget.dart';
import 'package:monix/screens/images/image_preview_screen.dart';
import 'package:monix_assets/monix_assets.dart';
import 'package:network/category/data/model/all_category_model.dart';
import 'package:network/category/provider/all_category_provider.dart';
import 'package:network/images/data/model/all_images_model.dart';
import 'package:network/images/provider/all_images_provider.dart';
import 'package:network/images/provider/all_images_state_provider.dart';
import 'package:network/sub_category/provider/provider.dart';

import '../../router/custom_page_transition.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const HomeScreen(),
        state: state,
      );

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool isPortraitSelected = false;
  DateTime? _lastPressedAt;
  List<ImagesDataModel>? imagesData;
  List<CategoryDataModel>? categoryData;
  List<CategoryDataModel>? homeCategory;
  final scrollController = ScrollController();

  //   late final ScrollController _scrollController = ScrollController()
  // ..addListener(
  //   () async {
  //     if (ref.read(allImagesDataProvider.notifier).isPagination) {
  //       final page = ref.watch(pageProvider);
  //       final pageSize = ref.watch(pageSizeProvider);
  //       final total = ref.watch(allImagesDataProvider).allImages.total;
  //       if (((page) * pageSize) < (total??0) &&
  //           _scrollController.offset >= _scrollController.position.maxScrollExtent &&
  //           !_scrollController.position.outOfRange) {
  //         ref.read(allImagesDataProvider.notifier).state =
  //             ref.read(allImagesDataProvider).copyWith(isLoadingMore: true);
  //         ref.read(allImagesDataProvider.notifier).fetchNextBatch(
  //          type: isPortraitSelected ?'reel':'post',
  //          page: 1,
  //          limit: 18,
  //         );
  //       }
  //     }
  //   },
  // );

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      scrollController.addListener(_onScrollListener);
      getAllImages(type: 'post');
      getAllCategory(ref: ref);
    });
    super.initState();
  }

  void getAllCategory({required WidgetRef ref}) {
    ref.read(allCategoryDataProvider.notifier).allCategory(
      queryParams: {},
      isSearch: false,
    );
  }

  Future<void> getAllImages({required String type}) async {
    // ref.read(allImagesDataProvider.notifier).page = 1;
    ref.read(pageProvider.notifier).state = 1;
    ref.read(allImagesDataProvider.notifier).isPagination = true;

    await ref
        .read(allImagesDataProvider.notifier)
        .allImages(isSearch: false, searchText: '', type: type, page: 1, limit: 18);
  }

  Future<void> _onScrollListener() async {
    if (ref.read(allImagesDataProvider.notifier).isPagination) {
      int page = ref.watch(pageProvider);
      final pageSize = ref.watch(pageSizeProvider);
      final total = ref.watch(allImagesDataProvider).allImages.total;
      print(":::::page$page");
      print(":::::::::pagesize $pageSize");
      print("::::::total $total");
      if (((page) * pageSize) < (total ?? 0) &&
          scrollController.offset >= scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        ref.read(pageProvider.notifier).state = ++page;

        ref.read(allImagesDataProvider.notifier).state = ref.read(allImagesDataProvider).copyWith(isLoadingMore: true);
        await ref.read(allImagesDataProvider.notifier).fetchNextBatch(
              type: isPortraitSelected ? 'reel' : 'post',
              page: page,
              limit: 18,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    imagesData = ref.watch(allImagesDataProvider.notifier).getAllImages();
    categoryData = ref.watch(allCategoryDataProvider.notifier).getAllCategory();
    homeCategory = ref.watch(allCategoryDataProvider.notifier).getHomeCategory();
    final subCat = ref.watch(subCategoryDataProvider.notifier).getsubCategory();
    print('IMG-LENGTH---->>>>>>>${imagesData!.length}');
    print('HOME CAT---->>>>>>>${homeCategory!.length}');
    print('SUB::::CAT---->>>>>>>${subCat.length}');
    final isLoading = ref.watch(allImagesDataProvider).isLoading;
    final isLoadingMore = ref.watch(allImagesDataProvider).isLoadingMore;

    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        color: color,
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        title: StringManager.monixAiGods,
        text: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            StringManager.monixAiGods,
            style: TextStyle(
              color: color.white,
              fontSize: 21,
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
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 22.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///HOME CATEGORY WIDGET
                    CategoryWidget(
                      color: color,
                      ref: ref,
                      categoryData: categoryData,
                      homeCategory: homeCategory,
                    ),

                    SizedBox(
                      height: 16.w,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        right: 20.h,
                        left: 20.h,
                      ),
                      child: AllImagesWidget(
                        scrollController: scrollController,
                        isTitle: true,
                        imagesDataModel: imagesData,
                        // isLoading: isLoading,
                        portraitSel: isPortraitSelected,
                        onPortraitTap: () {
                          if (isPortraitSelected == false) {
                            isPortraitSelected = true;
                            getAllImages(type: StringManager.reel);
                          }
                          setState(() {});
                        },
                        onSquareTap: () {
                          if (isPortraitSelected == true) {
                            isPortraitSelected = false;
                            getAllImages(type: StringManager.post);
                          }
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!) > const Duration(seconds: 2)) {
      // Show a toast message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).monixColors.secondary1,
          content: Text(
            "Press back again to exit",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
      // Update the time of the last back button press
      _lastPressedAt = DateTime.now();
      // Don't exit the app yet
      return Future.value(false);
    }
    // Exit the app
    SystemNavigator.pop();
    return Future.value(true);
  }
}

class ImageSizeWidget extends StatelessWidget {
  const ImageSizeWidget({
    super.key,
    required this.isTitle,
    required this.onPortraitClick,
    required this.onSquareClick,
    required this.portraitSelected,
  });

  final bool isTitle;
  final void Function() onPortraitClick;
  final void Function() onSquareClick;
  final bool portraitSelected;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTitle
            ? Column(
                children: [
                  Text(
                    StringManager.imageSize,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CommonSolidButton(
                title: "Square",
                isBorder: true,
                borderWidth: 0.5.h,
                fillColor: portraitSelected ? Colors.transparent : color.secondary1,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                borderColor: portraitSelected ? color.borderColor : color.secondary1,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  color: portraitSelected ? color.secondary1 : color.white,
                  fontWeight: FontWeight.w600,
                ),
                onButtonClick: onSquareClick,
                icon: icons.square.svg(
                    width: 13.w,
                    height: 13.w,
                    fit: BoxFit.cover,
                    color: portraitSelected ? color.secondary1 : color.white),
              ),
            ),
            SizedBox(
              width: 14.h,
            ),
            Expanded(
              child: CommonSolidButton(
                title: "Portrait",
                isBorder: true,
                borderWidth: 0.5.h,
                fillColor: portraitSelected ? color.secondary1 : Colors.transparent,
                borderColor: portraitSelected ? color.secondary1 : color.borderColor,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  color: portraitSelected ? color.white : color.secondary1,
                  fontWeight: FontWeight.w600,
                ),
                onButtonClick: onPortraitClick,
                icon: icons.portrait.svg(
                  width: 13.w,
                  height: 17.w,
                  fit: BoxFit.cover,
                  color: portraitSelected ? color.white : color.secondary1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
