import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix/screens/home/all_images_widget.dart';
import 'package:monix/screens/home/category_widget.dart';
import 'package:monix/screens/home/new_images_widget.dart';
import 'package:monix_assets/monix_assets.dart';

import '../../router/custom_page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static AppPageTransition builder(BuildContext context, GoRouterState state) =>
      AppPageTransition(
        page: const HomeScreen(),
        state: state,
      );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        color: color,
        title: StringManager.monixAiGods,
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
  const imageSizeWidget({super.key, required this.isTitle});
  final bool isTitle;

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
            children: [
              Expanded(
                child: CommonSolidButton(
                  title: "Portrait",
                  isBorder: true,
                  borderWidth: 0.5.h,
                  borderColor: color.borderColor,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: color.secondary1,
                    fontWeight: FontWeight.w600,
                  ),
                  onButtonClick: () {},
                  icon: icons.camera
                      .svg(height: 24.h, width: 24, color: color.white),
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
                  borderColor: color.borderColor,
                  textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: color.secondary1,
                    fontWeight: FontWeight.w600,
                  ),
                  onButtonClick: () {},
                  icon: icons.camera
                      .svg(height: 24.h, width: 24, color: color.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
