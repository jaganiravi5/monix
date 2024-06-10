import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'common_utills/common_utills.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.padding,
    required this.title,
    required this.onButtonClick,
    this.textStyle,
    this.borderRadius,
    this.icon,
    //required this.theme,
  });

  final EdgeInsetsGeometry? padding;
  final String title;
  final void Function() onButtonClick;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).monixColors;
    return InkWell(
      onTap: () => onButtonClick(),
      child: Stack(
        children: [
          Container(
            // width: MediaQuery.of(context).size.width,
            padding: padding ?? EdgeInsets.symmetric(vertical: 16.w),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(14.w),
              gradient: CommonUtills.getGradient(context: context),
              boxShadow: [
                BoxShadow(
                  color: theme.secondary1.withOpacity(0.17),
                  spreadRadius: 5,
                  blurRadius: 48,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  icon ?? SizedBox.shrink(),
                  Text(
                    title,
                    style: textStyle ??
                        TextStyle(
                          color: theme.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(14.w),
              topLeft: Radius.circular(14.w),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 52.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.w),
                gradient: LinearGradient(
                  colors: [
                    theme.white.withOpacity(0.29),
                    theme.white.withOpacity(0.1),
                    Colors.transparent,
                  ], // Red to orange (adjust as needed)
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.1, 0.2],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommonSolidButton extends StatelessWidget {
  const CommonSolidButton({
    super.key,
    this.padding,
    required this.title,
    required this.onButtonClick,
    required this.isBorder,
    this.borderColor,
    this.textStyle,
    this.borderWidth,
    this.icon,  this.fillColor, this.borderRadius,
  });

  final EdgeInsetsGeometry? padding;
  final String title;
  final bool isBorder;
  final void Function() onButtonClick;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? icon;
  final Color? fillColor;final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).monixColors;
    return InkWell(
      borderRadius: BorderRadius.circular(14.w),
      onTap: () => onButtonClick(),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: padding ?? EdgeInsets.symmetric(vertical: 16.w),
            decoration: isBorder
                ? BoxDecoration(
                    borderRadius:borderRadius?? BorderRadius.circular(14.w),
                    // color: theme.bgSolidColor,
                    border: Border.all(
                      color: borderColor ?? Colors.white,
                      width: borderWidth ?? 1.h,
                    ),
                    color: fillColor??Colors.transparent
                  )
                : BoxDecoration(
                    borderRadius: borderRadius??BorderRadius.circular(14.w),
                    color:fillColor?? theme.bgSolidColor,
                  ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? SizedBox.shrink(),
                  icon != null
                      ? SizedBox(
                          width: 8.h,
                        )
                      : SizedBox.shrink(),
                  Text(
                    title,
                    style: textStyle ??
                        TextStyle(
                          color: theme.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
