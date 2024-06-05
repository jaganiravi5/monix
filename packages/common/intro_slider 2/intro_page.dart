/*
import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    super.key,
    required this.title,
    required this.desc,
    required this.image,
    required this.descBody,
  });

  final String title;
  final String desc;
  final SvgPicture image;
  final String descBody;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image,
        const SpaceLarger(),
        Text(
          title,
          style: theme.textTheme.headlineLarge?.copyWith(
            color: theme.myProfamsColors.titleText,
          ),
        ),
        SpaceMedium(),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          descBody,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 13.sp,
            color: theme.myProfamsColors.regularText,
          ),
        ),
      ],
    );
  }
}
*/
