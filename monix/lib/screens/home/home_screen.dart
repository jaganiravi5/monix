import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/screens/home/all_images_widget.dart';
import 'package:monix/screens/home/category_widget.dart';
import 'package:monix/screens/home/new_images_widget.dart';
import 'package:monix_assets/monix_assets.dart';

import '../../router/custom_page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const HomeScreen(),
        state: state,
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isPortraitSelected = true;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        color: color,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 22.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryWidget(color: color),
                  SizedBox(height: 32.h),
                  imageSizeWidget(
                    isTitle: true,
                    onPortraitClick: () {
                      isPortraitSelected = !isPortraitSelected;
                      setState(() {});
                    },
                    onSquareClick: () {
                      isPortraitSelected = !isPortraitSelected;
                      setState(() {});
                    },
                    portraitSelected: isPortraitSelected,
                  ),
                  SizedBox(
                    height: 38.h,
                  ),
                  NewImagesWidget(),
                  SizedBox(
                    height: 38.h,
                  ),
                  AllImagesWidget(
                    isTitle: true,
                    portraitSel: isPortraitSelected,
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

class imageSizeWidget extends StatelessWidget {
  const imageSizeWidget({
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
    return Padding(
      padding: EdgeInsets.only(
        right: 20.h,
        left: 20.h,
      ),
      child: Column(
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
                  title: "Portrait",
                  isBorder: true,
                  borderWidth: 0.5.h,
                  borderColor: portraitSelected ? color.secondary1 : color.borderColor,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: color.secondary1,
                    fontWeight: FontWeight.w600,
                  ),
                  onButtonClick: onPortraitClick,
                  icon: icons.portrait.svg(
                    width: 13.w,
                    height: 17.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 14.h,
              ),
              Expanded(
                child: CommonSolidButton(
                  title: "Square",
                  isBorder: true,
                  borderWidth: 0.5.h,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  borderColor: portraitSelected ? color.borderColor : color.secondary1,
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: color.secondary1,
                    fontWeight: FontWeight.w600,
                  ),
                  onButtonClick: onSquareClick,
                  icon: icons.square.svg(
                    width: 13.w,
                    height: 13.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
