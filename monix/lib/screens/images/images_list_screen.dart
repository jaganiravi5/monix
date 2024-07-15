import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/monix.dart';
import 'package:monix/router/custom_page_transition.dart';
import 'package:network/images/provider/all_images_provider.dart';
import '../../router/routes_name.dart';

class ImageListScreen extends ConsumerStatefulWidget {
  const ImageListScreen({
    super.key,
    required this.subCategoryId,
  });
  final String? subCategoryId;

  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: ImageListScreen(
          subCategoryId: state.extra as String?,
        ),
        state: state,
      );

  @override
  ConsumerState<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends ConsumerState<ImageListScreen> {
  bool isPortraitSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      getAllImages(type: 'post');
    });
    super.initState();
  }

  Future<void> getAllImages({required String type}) async {
    ref.read(allImagesDataProvider.notifier).page = 1;
    ref.read(allImagesDataProvider.notifier).isPagination = true;

    await ref.read(allImagesDataProvider.notifier).allImages(
        isSearch: false,
        searchText: '',
        type: type,
        subCateId: widget.subCategoryId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    final imageData = ref.watch(allImagesDataProvider.notifier).getAllImages();
    return Scaffold(
      appBar: CommonAppBar(
        color: color,
        onSuffixBtnClick: () => context.push(AppRoutesPath.ideaScreen),
        title: StringManager.allImages,
        leadingWidth: 40.w,
        icon: InkWell(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back_rounded,
            color: color.white,
            size: 28.h,
          ),
        ),
      ),
      backgroundColor: color.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 20.w,
            // ),
            // ImageSizeWidget(
            //   isTitle: false,
            //   portraitSelected: isPortraitSelected,
            //   onPortraitClick: () {
            //     isPortraitSelected = !isPortraitSelected;
            //     setState(() {});
            //   },
            //   onSquareClick: () {
            //     isPortraitSelected = !isPortraitSelected;
            //     setState(() {});
            //   },
            // ),
            SizedBox(
              height: 20.w,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 20.h,
                left: 20.h,
              ),
              child: AllImagesWidget(
                isTitle: false,
                imagesDataModel: imageData,
                // isLoading: ref.watch(tempLoadingProvider.notifier).state,
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
    );
  }
}
