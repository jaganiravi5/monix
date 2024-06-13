import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/monix.dart';
import 'package:monix/router/custom_page_transition.dart';

import '../../router/routes_name.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const ImageListScreen(),
        state: state,
      );

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  bool isPortraitSelected = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
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
            AllImagesWidget(
              isTitle: false,
              portraitSel: isPortraitSelected,
              onPortraitTap: () {
                isPortraitSelected = !isPortraitSelected;
                setState(() {});
              },
              onSquareTap: () {
                isPortraitSelected = !isPortraitSelected;
                setState(() {});
              },
              onImageTap: () => context.push(AppRoutesPath.imagePreviewScreen, extra: isPortraitSelected),
            ),
          ],
        ),
      ),
    );
  }
}
