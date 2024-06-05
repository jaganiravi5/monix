import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common_utills/common_utills.dart';

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
  final Image image;
  final String descBody;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).monixColors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.w),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              image,
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              // color: Colors.yellow,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [theme.bgColor.withOpacity(0.3), theme.bgColor, theme.bgColor],
                    stops: [0.25, 0.38, 1.0],
                    // Color transitions at 0%, 50%, and 100% of the gradient
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.mirror // Mirror the gradient if container size exceeds its dimensions
                    ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: theme.white,
                    ),
                  ),
                  SizedBox(
                    height: 14.sp,
                  ),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: theme.grey500,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(14.w),
                      gradient: CommonUtills.getGradient(context: context),

                      // Background color for the container
                      boxShadow: [
                        BoxShadow(
                            color: theme.bgColor,
                            blurRadius: 48.0, // Adjust blur radius for shadow softness
                            spreadRadius: 0.0,
                            offset: Offset(0, 16) // Negative spread to create inner shadow
                            ),
                      ],
                    ),
                    child: Center(child: Text('Inner Shadow Container')),
                  ),
                  SizedBox(
                    height: 24.w,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
