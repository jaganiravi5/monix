/*
import 'package:carousel_slider/carousel_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translations/translations.dart';

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
        (currentPage == 0)
            ? SizedBox(
                width: 50.h,
              )
            : SizedBox(
                child: InkWell(
                  onTap: () => carouselController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 16.sp,
                        color: theme.myProfamsColors.primary,
                      ),
                      Text(
                        context.l10n.onboard_prev,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.myProfamsColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: introPages.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => carouselController.animateToPage(entry.key),
                child: Container(
                  width: 10.w,
                  height: 10.h,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.myProfamsColors.unselectReasonsCheckbox),
                    borderRadius: BorderRadius.circular(20.r),
                    color: (currentPage == entry.key)
                        ? theme.myProfamsColors.delivered
                        : (currentPage - 1 == entry.key)
                            ? theme.myProfamsColors.delivered
                            : (currentPage - 2 == entry.key)
                                ? theme.myProfamsColors.delivered
                                : Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        (currentPage == 2)
            ? SizedBox(
                child: InkWell(
                  //Navigator to Login Screen
                  onTap: () => onLastTap(),
                  child: Row(
                    children: [
                      Text(
                        context.l10n.action_next,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.myProfamsColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.sp,
                        color: theme.myProfamsColors.primary,
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox(
                child: InkWell(
                  onTap: () => carouselController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: Row(
                    children: [
                      Text(
                        context.l10n.action_next,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: theme.myProfamsColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.sp,
                        color: theme.myProfamsColors.primary,
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
*/
