import 'package:carousel_slider/carousel_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroSliderIndicator extends StatelessWidget {
  const IntroSliderIndicator({
    super.key,
    required this.currentPage,
    required this.carouselController,
    required this.introPages,
    required this.onLastTap,
  });

  final int currentPage;
  final CarouselController carouselController;
  final List<Widget> introPages;
  final VoidCallback onLastTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: introPages.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: entry.key == currentPage ? 23.w : 6.w,
                  height: 6.h,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    // border: Border.all(color: theme.monixColors.onSecondary),
                    borderRadius: BorderRadius.circular(20.r),
                    color: entry.key == currentPage ? theme.monixColors.secondary1 : theme.monixColors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
