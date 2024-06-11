import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monix_assets/monix_assets.dart';

import '../../router/custom_page_transition.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  static AppPageTransition builder(BuildContext context, GoRouterState state) => AppPageTransition(
        page: const SavedScreen(),
        state: state,
      );

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).monixColors;
    return Scaffold(
      backgroundColor: color.bgColor,
      appBar: CommonAppBar(
        color: color,
        title: StringManager.monixAi,
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icons.noImage.svg(),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${StringManager.noImg}. ",
                  style: TextStyle(
                    color: color.grey500,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "${StringManager.search}",
                  style: TextStyle(
                    color: color.white,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: color.white,
                    decoration: TextDecoration.underline,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
