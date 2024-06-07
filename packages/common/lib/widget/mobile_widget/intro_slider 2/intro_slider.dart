import 'package:carousel_slider/carousel_slider.dart';
import 'package:common/common.dart';
import 'package:common/widget/mobile_widget/intro_slider%202/intro_page.dart';
import 'package:common/widget/mobile_widget/intro_slider%202/introslider_indicator.dart';

import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:monix_assets/monix_assets.dart';

class IntroSlider extends StatefulWidget {
  final VoidCallback onComplete;
  final void Function() onSkipClick;
  final void Function() onNextClick;
  final void Function() onGetStartedClick;

  const IntroSlider({
    Key? key,
    required this.onComplete,
    required this.onSkipClick,
    required this.onNextClick,
    required this.onGetStartedClick,
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
        title: StringManager.onboard1Title,
        desc: StringManager.onboard1Desc,
        image: images.onboard1Png.image(
            // fit: BoxFit.fill,
            ),
        descBody: '',
      ),
      IntroPage(
        title: StringManager.onboard2Title,
        desc: StringManager.onboard2Desc,
        image: images.onboard2.image(
            // fit: BoxFit.fill,
            ),
        descBody: '',
      ),
    ];
    final theme = Theme.of(context);

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
              bottom: 282.h,
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
              bottom: 23.h,
              left: 20,
              right: 20,
              child: currentPage == 0
                  ? Row(
                      children: [
                        Expanded(
                          child: CommonSolidButton(
                            title: StringManager.skip,
                            onButtonClick: () => widget.onSkipClick(),
                          ),
                        ),
                        SizedBox(
                          width: 31.w,
                        ),
                        Expanded(
                          child: CommonButton(
                            title: StringManager.next,
                            onButtonClick: () => widget.onNextClick(),
                          ),
                        )
                      ],
                    )
                  : CommonButton(title: StringManager.getStarted, onButtonClick: () => widget.onGetStartedClick()),
            ),

            // Positioned(
            //   right: 0,
            //   child: InkWell(
            //     onTap: () {
            //       //Navigator to Login Screen
            //       widget.onComplete();
            //     },
            //     child: Text('skip',
            //         style: theme.textTheme.bodyLarge?.copyWith(
            //           fontSize: 15.sp,
            //           fontWeight: FontWeight.w500,
            //           color: theme.monixColors.primary,
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
