/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:common/common.dart';

import 'package:common/src/widget/intro_slider/intro_page.dart';
import 'package:common/src/widget/intro_slider/introslider_indicator.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_profams_assets/my_profams_assets.dart';
import 'package:translations/translations.dart';

class IntroSlider extends StatefulWidget {
  final VoidCallback onComplete;

  const IntroSlider({
    Key? key,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final CarouselController carouselController = CarouselController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> introPages = [
      IntroPage(
        title: context.l10n.onboard_view_tasks,
        desc: '',
        image: MyProfamsAssets.images.onBoarding1.svg(
          fit: BoxFit.fill,
        ),
        descBody: '',
      ),
      IntroPage(
        title: context.l10n.onboard_complete_tasks,
        desc: '',
        image: MyProfamsAssets.images.onBoarding3.svg(
          fit: BoxFit.fill,
        ),
        descBody: '',
      ),
      IntroPage(
        title: context.l10n.onboard_safety_instructions,
        desc: context.l10n.onboard_safety_desc_title,
        image: MyProfamsAssets.images.onBoarding2.svg(
          fit: BoxFit.fill,
        ),
        descBody: context.l10n.onboard_safety_desc_body_text,
      ),
    ];
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        child: Stack(
          children: [
            CarouselSlider(
              items: introPages,
              carouselController: carouselController,
              options: CarouselOptions(
                height: size.height,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
            Positioned(
              bottom: 25.h,
              left: 0,
              right: 0,
              child: IntroSliderIndicator(
                currentPage: currentPage,
                carouselController: carouselController,
                introPages: introPages,
                onLastTap: () {
                  widget.onComplete();
                },
              ),
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () {
                  //Navigator to Login Screen
                  widget.onComplete();
                },
                child: Text(context.l10n.onboard_skip,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: theme.myProfamsColors.primary,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
